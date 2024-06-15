#!/usr/bin/env sh

# Configuration
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/Network'
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy templates into the local template directory
xcodeTemplate () {
  echo "==> Copying up Network Xcode file templates..."
  echo "dir path: $XCODE_TEMPLATE_DIR"
  
  if [ -d "$XCODE_TEMPLATE_DIR" ]; then
    rm -R "$XCODE_TEMPLATE_DIR"
  fi
  mkdir -p "$XCODE_TEMPLATE_DIR"
  
  # 템플릿 파일을 경로에 복사합니다.
  cp -R $SCRIPT_DIR/*.xctemplate "$XCODE_TEMPLATE_DIR"
  
 
}


xcodeTemplate

echo "==> ... success!"
