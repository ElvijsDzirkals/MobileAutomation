# Mobile Automation Proof of concept


## Features
- Starts and kills Appium server and Chromedriver
- Automaticly detects connected Android devices and runs test on them
- Tests are run in parallel threads for each connected device
- Cucumber used as BDD framework
- OptionParser created to easily implement argumented test runs
- Allure and Cucumber HTML report generated after test run
- Appium logs saved and archived in Jenkins pipeline
- Jenkins pipeline running tests whenever git repository got changes
- Pipeline progress sent to a Discord webhook
- Test case for buying an item from sportsdirect.com ( up to the point of payment )


## Tech used


- [[Appium]](https://appium.io/) - Appium is an open source test automation framework that uses Webdriver protocol
- [[Allure]](https://docs.qameta.io/allure/) - Lightweight test report tool
- [[Jenkins]](https://jenkins.io/) - Open source automation server which enables developers around the world to reliably build, test, and deploy their software
- [[Cucumber]](https://cucumber.io/) - Behaviour Driven Development framework
- [[Node.js]](https://nodejs.org/en/) - Open-source, cross-platform, back-end JavaScript runtime environment
- [[Java]](https://www.java.com/en/) - High-level, class-based, object-oriented programming language
- [[Nmap]](https://nmap.org/) - Free and open source utility for network discovery and security auditing
- [[Android Debug Bridge]](https://developer.android.com/studio/command-line/adb) - Versatile command-line tool that lets you communicate with an Android device


## Installation

This POC requires Ruby 2.5+ , Java 8+ and Node.Js 10+

Java installation: http://jdk.java.net/16/

Homebrew:
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

NodeJS , Appium, Allure and Nmap - used for checking if Appium server is started on the chosen port:
```sh
brew install node
brew install appium
brew install allure
brew install nmap
```

Ruby Version Manager:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Installing Ruby using the new version:
```sh
rvm install 3.0.1
rvm use 3.0.1
```

Android Debug Bridge(Either download [ Android studio ](https://developer.android.com/studio) and launch it or install just the brew cask if you need only the ADB)
```sh
brew install --cask android-platform-tools
```


To make sure everything is set up correctly install and run appium-doctor
Optional warnings can be ignored

```sh
npm install appium-doctor -g
appium-doctor --android
```

## Running locally
Clone the repository
Connect your devices / Start emulators
Install gems:
```sh
bundle install
```
On a fresh ruby 3+ install bundle install might fail while installing eventmachine gem due to missing openssl extension, to fix the issue install eventmachine with openssl
```sh 
gem install eventmachine -- --with-cppflags=-I/usr/local/opt/openssl/include
```

And just run the main.rb file , you can add --environment argument , but it is created as just a proof of concept, and won't actually impact the tests
```sh 
ruby main.rb
```

## Jenkins setup
To run the tests on Jenkins just create a new pipeline job that uses jenkinsfiles from SCM and set the path to:
```sh 
jenkinsfiles/tests.jenkinsfile
```

## Gems used

| Gem | Gem repository links |
| ------ | ------ |
| appium_lib | [https://rubygems.org/gems/cucumber] |
| cucumber | [https://rubygems.org/gems/cucumber] |
| allure-ruby-commons | [https://rubygems.org/gems/allure-ruby-commons] |
| allure-cucumber | [https://rubygems.org/gems/allure-cucumber] |
| rspec | [https://rubygems.org/gems/rspec] |



