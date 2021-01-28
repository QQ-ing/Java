# 十二要素应用（The Twelve Factors）

编写云原生应用或微服务应遵循的架构规范。

## 单一代码基础（Single code base）

* 一个微服务一份代码基（版本库），切莫将多个微服务的代码放到一个版本库中。因为不同的微服务可能会部署到不同的服务器，保持代码独立，更利于测试，部署和运维；
* 所有部署的代码库都是相同的，不管是product版本、test版本还是dev版本，他们都共享同一份代码基。

## 包依赖（Bundle dependencies）

* 显式声明并隔离依赖项，不要把依赖的代码和本地代码混淆，尽量保持隔离；
* 可以通过Maven等工具，将依赖项隔离出去，这样可以保持多个微服务共享的依赖项一致；
* 打包之后， 所有的依赖都要打包在可执行文件或者可部署包中。

## 配置外部化（Externalizing configurations）

* 开发阶段、测试阶段、部署阶段使用的配置参数都会不一样，我们需要隔离这些配置；
* 不同微服务之间需要共享很多配置参数，需要保持这些参数一致；
* 可以通过统一的配置服务器，对所有的微服务进行统一配置分发和同步，例如ZooKeeper。

## Backing services are addressable

?? 这个没搞懂

## Isolation between build, release, and run



## Stateless, shared nothing processes

* 应用尽可能地设计为**无状态**和**无共享**；
* 如果应用是无状态的，那么它的容错性很高，同时很容易进行伸缩扩展；
* 如果需要保存状态，可以使用数据库或者内存缓存；

## Expose services through port bindings



## Concurrency for scale out

* 通过流程模型进行扩展（可通过复制进行并发扩展）；

## Disposability, with minimal overhead

## Development, production parity

## 日志外部化（Externalizing logs）

* 把日志当成事件流；
* 开发环境环境下，可以将日志定向到stdout，而在生产环境中，尽量将日志流输出到统一的日志中心，便于查询，调戏和分析；
* 并不是所有的日志都需要输出到日志中心，只需要输出业务相关的日志即可，否则，日志可能会成为系统瓶颈；
* 日志框架可使用Splunk, greylog, Logstash, Logplex, Loggly。

## Package admin processes



