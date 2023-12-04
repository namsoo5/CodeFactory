#!/usr/bin/env sh

# Configuration
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/TCA'
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy templates into the local template directory
xcodeTemplate () {
  echo "==> Copying up MMM Xcode file templates..."
  echo "dir path: $XCODE_TEMPLATE_DIR"
  
  if [ -d "$XCODE_TEMPLATE_DIR" ]; then
    rm -R "$XCODE_TEMPLATE_DIR"
  fi
  mkdir -p "$XCODE_TEMPLATE_DIR"
  
  # 템플릿 파일을 경로에 복사합니다.
  cp -R $SCRIPT_DIR/*.xctemplate "$XCODE_TEMPLATE_DIR"
  
  # Reducer, View 템플릿 파일을 Feature폴더에 복사합니다.
  cp -R $SCRIPT_DIR/TCAView.xctemplate/* "$XCODE_TEMPLATE_DIR/MMM.xctemplate/___FILEBASENAME___Feature/"
  # UseCase 템플릿 파일을 복사합니다
  cp -R $SCRIPT_DIR/UseCase.xctemplate/* "$XCODE_TEMPLATE_DIR/MMM.xctemplate/___FILEBASENAME___Domain/"
  # Service 템플릿 파일을 복사합니다
  cp -R $SCRIPT_DIR/Service.xctemplate/* "$XCODE_TEMPLATE_DIR/MMM.xctemplate/___FILEBASENAME___Service/"
}


xcodeTemplate

echo "==> ... success!"
