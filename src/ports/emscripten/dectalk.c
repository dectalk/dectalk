#include "emscripten.h"
#include "../../dapi/src/api/ttsapi.h"

#include <stdio.h>

int main() {
  char* version;
  TextToSpeechVersion(&version);

  printf("Hello world! You are running DECtalk %s\n", version);

  return 0;
}
