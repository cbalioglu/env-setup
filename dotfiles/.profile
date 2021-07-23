# Load the local pre-configuration.
[ -f ~/.profile.pre ] && . ~/.profile.pre

# Prepend the user-specific bin directories to the PATH.
PATH=~/.local/bin.ccache:~/.local/bin:~/.local/cuda/bin:$PATH

# Make sure that local libraries can be found by the dynamic linker.
if [ "$(uname -s)" = Linux ]; then
    LD_LIBRARY_PATH=~/.local/cuda/lib:~/.local/cuda/lib64:~/.local/cuda/extras/CUPTI/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
fi

export LD_LIBRARY_PATH=~/.local/lib:~/.local/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

# Make sure that local libraries can be found by CMake.
export CMAKE_PREFIX_PATH=~/.local${CMAKE_PREFIX_PATH:+:$CMAKE_PREFIX_PATH}

# Load Bash specific settings.
if [ -n "$BASH" ] && [ "$BASH" != /bin/sh ]; then
    . ~/.bashrc
fi

# Load the local post-configuration.
[ -f ~/.profile.post ] && . ~/.profile.post
