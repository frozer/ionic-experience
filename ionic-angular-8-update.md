# Updating Ionic 4/Angular 7 to Ionic 5.3.1/Angular 8

Based on some document found in the deeps of Ionic issue tracker :-)

Update @ionic/angular and @ionic/angular-toolkit to the latest release

```shell
npm install @ionic/angular@latest @ionic/angular-toolkit@latest --save
```

From here we can run the following commands

```shell
npx ng update @angular/core @angular/cli
```
Now most packages should be updated, just to be sure, we also need to update these 

> Note from Denis
>
> At this point everything is gone to hell :-) I have to run upgrade command with --force. And I received an error about zone.js dependency.
> Used https://medium.com/better-programming/upgrade-to-angular-8-beta-within-10-minutes as a quick note. Performed following steps:
```shell
npm install zone.js@0.9.1
```
> Then, dependencies was installed:
```shell
npm install @types/jasmine@latest @types/node@latest codelyzer@latest karma@latest karma-chrome-launcher@latest karma-cli@latest karma-jasmine@latest karma-jasmine-html-reporter@latest jasmine-core@latest jasmine-spec-reporter@latest protractor@latest tslint@latest webpack@latest rxjs-tslint@latest --save-dev
```
> After that I returned to initial document steps, and continued with "Install the latest angular devkit updates" below.

Install the latest angular devkit updates with 

```shell
npm i @angular-devkit/architect@latest @angular-devkit/build-angular@latest @angular-devkit/core@latest @angular-devkit/schematics@latest
```

or if you’re on a mac/linux

```shell
npm i @angular-devkit/{architect,build-angular,core,schematics}@latest
```

## Potential Issues

> Note from Denis
>
> Really useful was to drop node-modules folder and remove packahe-lock.json, then perform _npm install_, and start again
>

There is a known bug in an older version of the Angular CLI that will cause the update commands to stop running and exit. If you encounter this, please look over this issue and use the commands below.

https://github.com/angular/angular-cli/issues/14589

```shell
npx ng update @angular/core
npx ng update --allow-dirty @angular/core --from 7 --to --migrate-only

ng update @angular/cli --allow-dirty
ng update @angular/cli --allow-dirty --from 7 --to 8 --migrate-only
```


There is a known bug where the Angular CLI will attempt to install Angular 8.2.0-next. If you encounter this, please look over this issue and use the commands below:

https://github.com/angular/angular-cli/issues/14980

```shell
npm install @angular/cli@latest
npx ng update @angular/core
```

Notice that this has you updating the Angular CLI first, then updating Angular Core. From here, you can continue on with the remaining commands in the guide above.

If you encounter any problems, please open a new issue on the Ionic repo with detailed steps to reproduce: https://github.com/ionic-team/ionic/issues
