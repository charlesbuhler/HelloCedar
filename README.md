# Hello, Cedar!

Objective-C applications using Blindside dependency injection and Cedar tests require a fair amount of boilerplate code before developers can start driving out business value. This repo provides a "Hello, World!" template of a Cedar/Blindside project meant to be a starting point for rapid behavior-driven Objective-C development.


## Getting started

1. "Hello, Cedar!" has dependant git modules. After cloning locally, activate and update the submodules:

  ```bash
  git submodule update --init
  ```

2. After the submodules have cloned into the project, open the HelloCedar.xcodeproj in Xcode, run the tests and build via the simulator to make sure the project builds and runs
3. Replace this readme, licence, etc. with domain specific content and start test driving


## How to use as a template

"Hello, Cedar!" can be used as a starting point for development. Previous commits made to the project would not be individually relevant to projects that use it as a template. As such, I recommend cloning the project, squashing the commits into one "Initialize project with HelloCedar template" commit and mirror pushing to a new repo you own.

1. After reviewing the HelloCedar commits to understand the contents of the project, make a bare clone of the repository and navigate into the project
  ```bash
  git clone --bare https://github.com/charlesbuhler/HelloCedar.git
  cd HelloCedar.git
  ```

2. Create a new empty repository for your project in Github. Then mirror-push to the new repository
  ```bash
  git push --mirror https://github.com/your-username/new-repository.git
  ```

3. Navigate out of HelloCedar and remove the temporary local repository
  ```bash
  cd ..
  rm -rf HelloCedar.git
  ```

4. Clone your newly populated project locally, activate and update the submodules
  ```bash
  git clone https://github.com/your-username/new-repository.git
  cd NewRepository
  ```

5. Squash all commits into one
  ```bash
  git rebase --root -i
  ```
  For each commit except the first, change "pick" to "squash"

6. Rename the single commit left to something more logical
  ```bash
  git commit --amend --date="$(date +%s)" -m "Initialize project with HelloCedar template from https://github.com/charlesbuhler/HelloCedar"
  ```

7. Force push the new history to your newly created repository
  ```bash
  git push -f
  ```

8. Activate and update the submodules
  ```bash
  git submodule update --init
  ```

9. Open NewRepository.xcodeproj in Xcode and rename instances on HelloCedar with your app name. Some changes, like the Product Bundle Identifier need to be renamed by hand.

10. Make sure project builds and tests run.


## How it works

The InjectorProvider creates a Blindside injector (via the class method "injector") with instances of the needed modules. In the "Hello, Cedar!" template, the only two needed modules being the RouterModule and the ControllersModule. The RouterModule creates a binding of Router to a block instance of Router's designated initializer. Similarly, the ControllersModule creates a binding of HelloViewController to a block instance of the HelloViewController's designated initializer. Any additional controllers created would need bindings added to the ControllersModule.

The AppDelegate creates an injector from the InjectorProvider on initialization. On ```[application willFinishLaunchingWithOptions]```, the AppDelegate creates and holds onto a Router instance from the injector. In the Router's rootViewController method, the Router creates a HelloViewController from the injector.

The HelloViewController is initialized with any needed classes (composition over inheritance). The power of Blindside and dependency injection more broadly, is when HelloViewController is tested, modules it depends on can be mocked out. Each class can be isolated in testing. In the "Hello, Cedar!" template, HelloViewController only relies on one class TitleTextTransformer. HelloViewController has a designated initializer initWithTitleTextTransformer, which is declared in the class and specified in the ControllersModule.


## Tooling

* [Cedar](https://github.com/pivotal/cedar) - BDD framework for Objective-C
* [Blindside](https://github.com/jbsf/blindside) - Objective-C dependency injection framework
* [PivotalCoreKit](https://github.com/pivotal/PivotalCoreKit) - Bells and whistles for Objective-C development

