Updating Ionic to Angular 8

Update @ionic/angular and @ionic/angular-toolkit to the latest release

```shell
npm install @ionic/angular@latest @ionic/angular-toolkit@latest --save
```

From here we can run the following commands

```shell
npx ng update @angular/core @angular/cli
```

Now most packages should be updated, just to be sure, we also need to update these 

Install the latest angular devkit updates with 

```shell
npm i @angular-devkit/architect@latest @angular-devkit/build-angular@latest @angular-devkit/core@latest @angular-devkit/schematics@latest
```

or if you’re on a mac/linux

```shell
npm i @angular-devkit/{architect,build-angular,core,schematics}@latest
```

Potential Issues
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
