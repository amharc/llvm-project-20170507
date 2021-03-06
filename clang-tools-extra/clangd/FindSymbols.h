//===--- FindSymbols.h --------------------------------------*- C++-*------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Queries that provide a list of symbols matching a string.
//
//===----------------------------------------------------------------------===//
#ifndef LLVM_CLANG_TOOLS_EXTRA_CLANGD_FINDSYMBOLS_H
#define LLVM_CLANG_TOOLS_EXTRA_CLANGD_FINDSYMBOLS_H

#include "Protocol.h"
#include "llvm/ADT/StringRef.h"

namespace clang {
namespace clangd {
class SymbolIndex;

/// Searches for the symbols matching \p Query. The syntax of \p Query can be
/// the non-qualified name or fully qualified of a symbol. For example, "vector"
/// will match the symbol std::vector and "std::vector" would also match it.
/// Direct children of scopes (namepaces, etc) can be listed with a trailing
/// "::". For example, "std::" will list all children of the std namespace and
/// "::" alone will list all children of the global namespace.
/// \p Limit limits the number of results returned (0 means no limit).
llvm::Expected<std::vector<SymbolInformation>>
getWorkspaceSymbols(llvm::StringRef Query, int Limit,
                    const SymbolIndex *const Index);

} // namespace clangd
} // namespace clang

#endif
