#!/usr/bin/env bash
# Summary: Build swift from source
# Usage: swiftenv-build [--definitions] [--clean] [--no-clean] <package> <destination>

set -E

exec 3<&2 # preserve original stderr at fd 3

# fetch_git repository-name branch [destination]
fetch_git() {
  if ! type git &>/dev/null; then
    echo "error: please install \`git\` and try again." >& 2
    exit 1
  fi

  if [ -d "$3" ]; then
    echo "Found "$3", skipping download"
  else
    echo "Downloading $1 ($2) from git"
    git clone --depth 1 --branch "$2" "https://github.com/apple/$1.git" "$3" >&4 2>&1
  fi
}

# fetch_git repository-name release [destination]
fetch_github_release() {
  if [ -d "$3" ]; then
    echo "Found "$3", skipping download"
  else
    echo "Downloading $1 ($2)"
    curl -Lo "$1-$2.tar.gz" "https://github.com/apple/$1/archive/$2.tar.gz"

    mkdir "$3"
    tar xzf "$1-$2.tar.gz" --strip-components 1 -C "$3"
  fi
}

build_swift() {
  if ! type pod2man &>/dev/null && [[ -x "/usr/bin/core_perl/pod2man" ]]; then
    # On Arch linux, pod2man is in /usr/bin/core_perl
    export PATH="/usr/bin/core_perl:$PATH"
  fi

  if type python2 &>/dev/null; then
    # When python2 exists, link python to python2

    if ! [[ -x "$TMP/bin/python" ]]; then
      mkdir -p "$TMP/bin"
      ln -s "$(which python2)" "$TMP/bin/python"
    fi

    export PATH="$TMP/bin:$PATH"
  fi

  cd swift
  echo "Building Swift"
  echo "This may take a very long time..."

  ./utils/build-script -R -- --install-prefix="$destination" >&4 2>&1
  cd "$TMP"
}

install_swift() {
  mkdir -p "$destination/usr/bin"
  cp "$TMP/build/Ninja-ReleaseAssert/"swift-*/bin/swift{,-demangle} "$destination/usr/bin"
}

build_failed() {
  { echo "Building Swift failed"
    echo "Check out the logfile for more information: $LOG_PATH"
    echo "You can inspect or delete the working tree at: $TMP"
    rm -fr "$destination"
  } >&2
  exit 1
}

list_definitions() {
  ls "$SWIFTENV_SOURCE_PATH/share/swiftenv-build" | sort_versions | uniq
}

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' | \
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

clean=true
definitions=false
unset VERBOSE

for args in "$@"; do
  if [ "$args" = "--no-clean" ]; then
    clean=false
  elif [ "$args" = "--clean" ]; then
    rehash=true
  elif [ "$args" = "--definitions" ]; then
    definitions=true
  elif [ "$args" = "--verbose" ]; then
    VERBOSE=true
  elif [ -z "$package" ]; then
    package="$args"
  elif [ -z "$destination" ]; then
    destination="$args"
  else
    echo "Unknown argument: $args"
    exit 1
  fi

  shift
done

if $definitions; then
  list_definitions
  exit 0
fi

if [ -z "$destination" ]; then
  echo "Usage: swiftenv build <package> <destination>"
  exit 1
fi

if [ -d "$destination" ]; then
  echo "$destination already exists."
  exit 1
fi

PACKAGE_DEFINITION="$SWIFTENV_SOURCE_PATH/share/swiftenv-build/$package"
if ! [ -r "$PACKAGE_DEFINITION" ]; then
  echo "Package definition not found for $package"
  exit 1
fi

# Swift build takes up a lot of room and unfortunately
# had issues where I've ran out of space in /tmp while building
TMP="$SWIFTENV_ROOT/tmp/swiftenv-build-$package"

mkdir -p "$TMP"
cd "$TMP"

SEED="$(date "+%Y%m%d%H%M%S").$$"
LOG_PATH="$TMP/swiftenv-build.$SEED.log"

exec 4<> "$LOG_PATH"  # open the log file at fd 4
if [ -n "$VERBOSE" ]; then
  tail -f "$LOG_PATH" &
  TAIL_PID=$!
  trap "kill $TAIL_PID" SIGINT SIGTERM EXIT
fi

mkdir -p "$destination"
trap build_failed ERR
source "$PACKAGE_DEFINITION"
install_swift

if $clean; then
  rm -fr $TMP
fi
