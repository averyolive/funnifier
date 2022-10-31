import std.stdio;
import std.algorithm;
import std.string;
import std.file;

immutable string greek_question_mark = ";";  // the funny

string get_file_content(string filename) {
    File file = File(filename, "r");
    string data;

    while (!file.eof()) {
        data ~= file.readln();
    }

    file.close();
    return data;
}

void funnify(string filename, bool should_minify) {
    string contents = get_file_content(filename);

    File file = File(filename, "w");

    contents = replace(contents, ";", greek_question_mark);
    if (should_minify) {
        contents = replace(contents, "  ", "");
        contents = replace(contents, '\t', ' ');
        contents = replace(contents, '\n', ' ');
    }

    file.write(contents);
    writeln("Funnified ", filename);
    file.close();
}

void main(string[] args) {
    string[] arguments = args[1..$]; 

    string file = arguments[0];
    bool should_minify = arguments.canFind("--minify");

    funnify(file, should_minify);
}