#include <string.h>
#include "ast_type.h"
#include "ast_decl.h"
#include "ast_stmt.h"
 
Type *Type::intType    = new Type("int");
Type *Type::doubleType = new Type("double");
Type *Type::voidType   = new Type("void");
Type *Type::boolType   = new Type("bool");
Type *Type::nullType   = new Type("null");
Type *Type::stringType = new Type("string");
Type *Type::errorType  = new Type("error"); 

Type::Type(const char *n) {
    Assert(n);
    typeName = strdup(n);
}

bool Type::IsEquivalentTo(Type* o) {
    if(IsEqualTo(Type::errorType) || 
    o->IsEqualTo(Type::errorType))
        return true;
    if(IsEqualTo(Type::nullType) && dynamic_cast<NamedType*>(o))
        return true;
    return IsEqualTo(o);
}

NamedType::NamedType(Identifier *i) : Type(*i->GetLocation()) {
    Assert(i != NULL);
    (id=i)->SetParent(this);
} 

bool NamedType::IsEqualTo(Type* o) {
    NamedType* ntype = dynamic_cast<NamedType*>(o);
    if(ntype == NULL)
        return false;
    return *(ntype->id)==*id;
}

bool NamedType::IsEquivalentTo(Type* o) {
    if(IsEqualTo(o))
        return true;
    NamedType* ntype = this;
    Decl* d;
    while((d=Program::gScope->table->Lookup(ntype->GetName()))) {
        ClassDecl* c = dynamic_cast<ClassDecl*>(d);
        if(c == NULL)
            return false;
        List<NamedType*> *imps = c->GetImplements();        
        for(int i = 0; i < imps->NumElements(); i++)
            if(imps->Nth(i)->IsEqualTo(o))
                return true;
        ntype = c->GetExtends();
        if(ntype == NULL)
            return false;
        if(ntype->IsEqualTo(o))
            return true;
    }
    return false;
}

void NamedType::ReportNotDeclaredIdentifier(reasonT r) {
    ReportError::IdentifierNotDeclared(id, r);
}

ArrayType::ArrayType(yyltype loc, Type *et) : Type(loc) {
    Assert(et != NULL);
    (elemType=et)->SetParent(this);
}

ArrayType::ArrayType(Type* et) : Type() {
    Assert(et != NULL);
    (elemType=et)->SetParent(this);
}

bool ArrayType::IsEqualTo(Type* o) {
    ArrayType* atype = dynamic_cast<ArrayType*>(o);
    if(atype == NULL)
        return false;
    return elemType->IsEqualTo(atype->elemType);
}

bool ArrayType::IsEquivalentTo(Type* o) {
    ArrayType* atype = dynamic_cast<ArrayType*>(o);
    if(atype == NULL)
        return false;
    return elemType->IsEquivalentTo(atype->elemType);
}

void ArrayType::ReportNotDeclaredIdentifier(reasonT r) {
    elemType->ReportNotDeclaredIdentifier(r);
}

