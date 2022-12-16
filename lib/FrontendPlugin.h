// Copyright 2018 The Clspv Authors. All rights reserved.
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

#include "clang/CodeGen/CodeGenAction.h"
#include "clang/Frontend/CompilerInstance.h"

namespace clspv {
struct ExtraValidationASTAction final : public clang::PluginASTAction {
  virtual std::unique_ptr<clang::ASTConsumer>
  CreateASTConsumer(clang::CompilerInstance &CI,
                    llvm::StringRef InFile) override;

  virtual bool ParseArgs(const clang::CompilerInstance &CI,
                         const std::vector<std::string> &arg) override {
    // Parsing succeeded.
    return true;
  }

  virtual clang::PluginASTAction::ActionType getActionType() override {
    return clang::PluginASTAction::AddBeforeMainAction;
  }
};

class PrintAttrsASTAction final : public clang::PluginASTAction {
  virtual std::unique_ptr<clang::ASTConsumer>
  CreateASTConsumer(clang::CompilerInstance &CI,
                    llvm::StringRef InFile) override;
  virtual bool ParseArgs(const clang::CompilerInstance &CI,
                         const std::vector<std::string> &arg) override {
    // Parsing succeeded.
    return true;
  }
  virtual clang::PluginASTAction::ActionType getActionType() override {
    return clang::PluginASTAction::AddBeforeMainAction;
  }

private:
  std::unordered_map<std::string, std::string> m_functionAttrs;
};
} // namespace clspv
