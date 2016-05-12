#include <phpcpp.h>
#include <iostream>

void myFunction()
{
    Php::out << "example output" << std::endl;
}

extern "C" {
    PHPCPP_EXPORT void *get_module() {
        static Php::Extension extension("standard_router", "1.0");
        extension.add(Php::Ini("standard_router.default_path", "home"));

        extension.add("myFunctionx", myFunction);

        return extension;
    }
}

