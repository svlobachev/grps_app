# Description
The hello world server and client demonstrate how to use Dart gRPC libraries to
perform unary RPCs.

See the definition of the hello world service in `protos/helloworld.proto`.

# Run the sample code
To compile and run the example, assuming you are in the root of the helloworld
folder, i.e., .../example/helloworld/, first get the dependencies by running:

```sh
$ pub get
```
## Run TCP sample code

Start the server:

```sh
$ dart bin/server.txt
```

Likewise, to run the client:

```sh
$ dart bin/client.txt
```
## Run UDS sample code

Start the server:

```sh
$ dart bin/unix_server.txt
```

Likewise, to run the client:

```sh
$ dart bin/unix_client.txt
```

>**Note** the `UDS` only support *nix plantform.

# Regenerate the stubs

If you have made changes to the message or service definition in
`protos/helloworld.proto` and need to regenerate the corresponding Dart files,
you will need to have protoc version 3.0.0 or higher and the Dart protoc plugin
version 0.7.9 or higher on your PATH.

To install protoc, see the instructions on
[the Protocol Buffers website](https://developers.google.com/protocol-buffers/).

The easiest way to get the Dart protoc plugin is by running

```sh
$ pub global activate protoc_plugin
```
brew tap leoafarias/fvm
brew install fvm
dart pub global activate fvm
*иногда помогает при ошибке: dart pub global activate fvm*

brew install protobuf
protoc --version

and follow the directions to add `~/.pub-cache/bin` to your PATH, if you haven't
already done so.

You can now regenerate the Dart files by running

*Настройка окружения

vim ~/.zshrc

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:/Users/sergeilobachev/flutter/bin"
export PATH="$PATH:/Users/sergeilobachev/flutter/.pub-cache/bin"
export PATH="$PATH:/Users/sergeilobachev/flutter/bin/cache/dart-sdk/bin"

Команда для сохранения файла в Vim и выхода из редактора есть :wq *


```sh
$ protoc --dart_out=grpc:lib/grpc/generated -Iprotos protos/helloworld.proto
```
