# RabbitMQ logging PoC

Demonstrates how to send logs from a Spring Boot application to RabbitMQ.
Required tools:

- Java 21
- Docker
- Terraform (optional)

## Setting up RabbitMQ

Launch the docker container of RabbitMQ:

```bash
docker compose up -d
```

We need to create some components inside RabbitMQ to make this work.

- VHost (it's like a "domain" inside RabbitMQ)
- User (has scoped permissions to VHost, app will use its credentials)
- Topic (logs will be written here)

All this can be created using the UI at `http://localhost:15672`, but it's 
cooler with Terraform. Change into 'terraform' directory.

```bash
terraform init
terraform plan --out rabbitmq.tfplan
terraform apply rabbitmq.tfplan
```

All components are created in the RabbitMQ broker, and the app is ready to start.

## Launch the app

Following command can be used:

```bash
./gradlew bootRun
```

The application will start to send logs every second. There are 2 appenders, 
both configured in the [logback config file](./src/main/resources/logback-spring.xml):

- `ch.qos.logback.core.ConsoleAppender`: the standard console appender.
- `org.springframework.amqp.rabbit.logback.AmqpAppender`: Provided by Spring AMQP, writes logs to the RabbitMQ topic created earlier.