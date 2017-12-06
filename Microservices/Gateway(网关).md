# Gateway(网关)

## Gateway(网关)的作用

### Authentication

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
