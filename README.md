# ui_social_amity

## Flutter version: fvm
    Please check version with path: .fvm/fvm_config.json

## :motorway: Flavors
- prod
- dev
- stg

## :computer: Run command
> flutter run --flavor flavor_name

## :iphone: Launch script for VSCode
Create or update .vscode/launch.json to include the following:
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "dev",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": [
                "--flavor",
                "dev"
            ]

        }
    ]
}
```

## Run Generator 
regenerate files.
> flutter pub run build_runner build --delete-conflicting-outputs

## Download GoogleService
Download in project firebase and paste to location below.
### iOS 
ios/Runner/GoogleService-Info.plist
### Android
android/app/google-services.json