# FIAP - DEVOPS
## 1SCJR - Projeto Pipeline
Prof: Fabiano da Silva Carneiro

-Desenvolvido por:
<ul>
  <li>Murillo Lopes Fernandes</li>
  <li>Eduardo Freire Cotrim</li>
  <li>Ana Carolina Alves Cola</li>
  <li>Marco Antonio da Paz Couzin</li>
</ul>

Projeto devops, integrando Github actions com Sonarcloud, Terraform cloud, Spring e AWS.

### 1 - Foi utilizado um projeto Spring Web com Maven e Java 11.

![image](https://github.com/murilLost/Devops-ON/assets/63795081/067384f5-708f-4bf4-b321-45dc3fe6a935)

### 2 - Utilizamos o Github Actions para rodar o pipeline.

![image](https://github.com/murilLost/Devops-ON/assets/63795081/5766f64a-687a-451c-a073-58071f64d7db)
  
### 3 - Criamos 2 branches, a Master e a Develop, cada uma com alguns steps diferentes.
Ambas rodam os steps de:
- unit-test
- code-analisys
- build
- publish

A develop roda:
- deploy-STG
- Smoketest
- testeIntegrados

A master roda:
- deploy-prod
- Terraform

![image](https://github.com/murilLost/Devops-ON/assets/63795081/7e78f6ef-d50b-45fd-b381-5e18d1779de4)

![image](https://github.com/murilLost/Devops-ON/assets/63795081/8c3e08fd-3eaf-450f-a5a5-661c6ec616d5)

### 4 - Sobre os steps

Alguns steps não possuem integração alguma, apenas rodando alguns scripts, printando uma mensagem qualquer.
Porém outros já são integrados com maven, Sonar, Terraform e AWS.

- unit-test: integrado com maven, ele roda os testes unitários presentes na aplicação Spring.
![image](https://github.com/murilLost/Devops-ON/assets/63795081/0a77bcd3-1bfe-4644-9676-62ad41ba96a9)

- code-analisys: integrado com Sonarcloud, ele verifica o status presente retornado pela análise do Sonar, e printa o status.
https://sonarcloud.io/api/qualitygates/project_status?projectKey=1scjr_devops-on
![image](https://github.com/murilLost/Devops-ON/assets/63795081/64ed8502-53eb-4984-8eb4-d6cffda01a52)

- build: integrado com Maven, ele builda o projeto Java.
![image](https://github.com/murilLost/Devops-ON/assets/63795081/be3d1a74-c772-489b-987f-f94521e44047)

- publish: integrado com Maven e AWS, ele pega o build gerado, em formato .jar, e envia para um bucket S3 na AWS, o qual será usado futuramente.
![image](https://github.com/murilLost/Devops-ON/assets/63795081/8771618d-dc62-4493-93e1-c047aff6e448)

- deploy-prod: Apenas printa a mensagem "Deploy PROD"

- deploy-STG: Apenas printa a mensagem "Deploy STG"

- Smoketest: Apenas roda um script que printa a mensagem "EXECUTANDO SMOKE TEST"

- testeIntegrados: Apenas roda um script que printa a mensagem "EXECUTANDO TESTES DE INTEGRACAO"

- Terraform: integrado com Terraform cloud e AWS, este step cuida da parte de provisionamento de infra na AWS, criando máquinas virtuais na EC2, auto scaling, VPCs, security groups e load balancers.
Além de pegar o jar presente no bucket S3 e subi-lo nas máquinas, disponibilizando as APIs para uso.
Além de subir uma máquina EC2, com uma página HTML simples.

Página: http://ec2-23-20-172-157.compute-1.amazonaws.com:8080/

APIs:
http://devops-on-lb-905107195.us-east-1.elb.amazonaws.com/
http://devops-on-lb-905107195.us-east-1.elb.amazonaws.com/devops
http://devops-on-lb-905107195.us-east-1.elb.amazonaws.com/public
http://devops-on-lb-905107195.us-east-1.elb.amazonaws.com/what-is-the-time

![image](https://github.com/murilLost/Devops-ON/assets/63795081/9c34dbe5-c7bf-4da2-b4e6-f0e1bcc81d56)

![image](https://github.com/murilLost/Devops-ON/assets/63795081/1fb05064-f139-4201-9cc7-fe4ec67106ca)
