# Gateway(网关)

## Gateway(网关)的作用

### Authentication

API网关可以用于统一处理外部调用的认证和授权，避免每个微服务单纯进行认证和授权。

在VPC(Virtual Private Cloud )内部微服务可以任意调用，而外部的调用统一由网关进行认证和授权，可以减少少量的网络开销，同时让微服务可以更关注自己的业务（而不用处理安全方面的东西）。

### Different protocol

### Load-balancing

### Request dispatching (including service discovery)

### Response transformation

### Circuit breaker

## 优点和缺点

### 优点

* Microservices can focus on business logic
* Clients can get all the data in a single hit
* Authentication, logging, and monitoring can be handled by the API Gateway
* It gives flexibility to use completely independent protocols in which clients and microservice can talk
* It can give tailor-made results, as per the clients needs
* It can handle partial failure

### 缺点

* It can cause performance degradation due to lots of happenings on the API Gateway
* With this, the discovery service should be implemented
* Sometimes, it becomes the single point of failure
* Managing routing is an overhead of the pattern
* Adding additional network hope in the call
* Overall, it increases the complexity of the system
* Too much logic implementation in this gateway will lead to another dependency problem
