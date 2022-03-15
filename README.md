# Cumulus Message Adapter Passthrough 
   This is a simple lambda function just returns same output as input
## How To Build Manually
        echo 'Building the lambda zip file'
        sh "pwd;mkdir venv;mkdir -p build/lambda;mkdir -p build/dist"
        sh "poetry config virtualenvs.path venv"
        sh "poetry install --no-dev"
        sh "cp ./cumulus_nc_converter/*.py venv/*/lib/*/site-packages/"
        sh "chmod -R 775 venv/*/lib/*/site-packages/"

        sh "cp -R venv/*/lib/*/site-packages/* build/lambda"
        sh "cp -R terraform/* build/dist"
        dir('build'){
            sh"pwd;ls -la"
            sh "cd lambda;zip -r ../${the_service}_lambda.zip .;cd ..;pwd;ls -la;cp ${the_service}_lambda.zip dist"
            sh "cd dist; zip -r ../${the_service}.zip ."
        }