# Hello, Cedar!

Objective-C applications using Blindside dependency injection and Cedar tests require a fair amount of boilerplate code before developers can start driving out business value. This repo provides a "Hello, World!" template of a Cedar/Blindside project meant to be a starting point for rapid behavior-driven Objective-C development.


## How it works

The InjectorProvider creates a Blindside injector (via the class method "injector") with instances of the needed modules. In the "Hello, Cedar!" template, the only two needed modules being the RouterModule and the ControllersModule. The RouterModule creates a binding of Router to a block instance of the Router alloc init. Similarly, the ControllersModule creates a binding of HelloViewController to a block instance of the HelloViewController alloc init. Any additional controllers created would need bindings added to the ControllersModule.

The AppDelegate creates an injector from the InjectorProvider on initialization. On [application willFinishLaunchingWithOptions], the AppDelegate creates and holds onto a router instance from the injector. In the router rootViewController method, the router creates a HelloViewController from the injector.

The HelloViewController is initialized with any needed classes (composition over inheritance). The power of Blindside, and dependency injection more broadly, is when HelloViewController is tested, modules it depends on can be mocked out. Each class can be isolated in testing. In the "Hello, Cedar!" template, HelloViewController only relies on one class TitleTextTransformer. HelloViewController has a designated initializer initWithTitleTextTransformer, which is declared in the class and specified in the ControllersModule.


## Tooling

* [Cedar](https://github.com/pivotal/cedar) - BDD framework for Objective-C
* [Blindside](https://github.com/jbsf/blindside) - Objective-C dependency injection framework


## Author

* [Charles Buhler](https://github.com/charlesbuhler)


Copyright (c) 2015 Charles Buhler. This software is licensed under the MIT License.

