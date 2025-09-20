#!/bin/bash

# This is a simple script to run LLM .com/models/google/gemma-2/tfLite/gemma2-2b-it-cpu-int8"
  exit 1
fi

adb /c:llm_inference_engine_cpu_main
"
docker cp "$CONTAINER_NAME":/mediapipe/bazel-bin/mediapipe/tasks/cc/genai/inference/c/llm_inference_engine_cpu_main llm_inference_engine_cpu_main
adb push llm_inference_engine_cpu_main "${ADB_WORK_DIR}"/llm_inference_engine_cpu_main

# Run the inference.
adb shell "taskset f0 ${ADB_WORK_DIR}/llm_inference_engine_cpu_main \
              --model_path='${ADB_WORK_DIR}/${MODEL_FILENAME}' \
              --prompt='${INPUT_PROMPT}'"
