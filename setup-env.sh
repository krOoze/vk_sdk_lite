# Copyright (c) 2015-2019 LunarG, Inc.

# source this file into an existing shell.

ARCH="$(uname -m)"
VULKAN_SDK="$(dirname "$(readlink -f "${BASH_SOURCE:-$0}" )" )/$ARCH"
export VULKAN_SDK
PATH="$VULKAN_SDK/bin:$PATH"
export PATH
LD_LIBRARY_PATH="$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH
VK_ADD_LAYER_PATH="$VULKAN_SDK/etc/vulkan/explicit_layer.d${VK_ADD_LAYER_PATH:+:$VK_ADD_LAYER_PATH}"
export VK_ADD_LAYER_PATH
if [ -n "$VK_LAYER_PATH" ]; then
    echo "Unsetting VK_LAYER_PATH environment variable for SDK usage"
    unset VK_LAYER_PATH
fi
