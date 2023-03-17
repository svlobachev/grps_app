// Copyright (c) 2018, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Dart implementation of the gRPC helloworld.GreetingService server.
import 'package:grpc/grpc.dart';
import 'package:helloworld/grpc/generated/helloworld.pbgrpc.dart';


class GreetingServiceService extends GreetingServiceBase {
  @override
  Future<ResponseMessage> sayHello(ServiceCall call, RequestMessage request) async {
    return ResponseMessage()..message = 'Hello, ${request.name}!';
  }
}

Future<void> main(List<String> args) async {
  final server = Server(
    [GreetingServiceService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
