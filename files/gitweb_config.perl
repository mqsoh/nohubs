# path to git projects (<project>.git)
$projectroot = "/git";

# directory to use for temp files
$git_temp = "/tmp";

# target of the home link on top of all pages
#$home_link = $my_uri || "/";

# html text to include at home page
#$home_text = "indextext.html";

# file with project list; by default, simply scan the projectroot dir.
#$projects_list = $projectroot;

# stylesheet to use
#@stylesheets = ("static/gitweb.css");

# javascript code for gitweb
#$javascript = "static/gitweb.js";

# logo to use
#$logo = "static/git-logo.png";

# the 'favicon'
#$favicon = "static/git-favicon.png";

# git-diff-tree(1) options to use for generated patches
#@diff_opts = ("-M");
@diff_opts = ();

# Highlight all supported file types.
#
# I'm not sure what the reason was behind GitWeb not supporting highlighting
# for all the file types supported by Highlight. Maybe they didn't want to
# maintain a list like this? :) Anyway, I generated this from the
# filetypes.conf in the Highlight repository:
#
# https://github.com/andre-simon/highlight/blob/master/filetypes.conf
#
# I pasted that into a Lua playground and ran the following program to generate
# this output.
#
#     for _, lang in pairs(FileMapping) do
#       name = lang.Lang
#       fnorext = lang.Extensions
#       if lang.Filenames then
#         fnorext = lang.Filenames
#       end
#       for _, ext in pairs(fnorext) do
#         print("$highlight_ext{\""..ext.. "\"} = \""..name.."\";")
#       end
#     end
$feature{"highlight"}{"default"} = [1];
our %highlight_ext;
$highlight_ext{"adb"} = "ada";
$highlight_ext{"ads"} = "ada";
$highlight_ext{"a"} = "ada";
$highlight_ext{"gnad"} = "ada";
$highlight_ext{"alg"} = "algol";
$highlight_ext{"dat"} = "ampl";
$highlight_ext{"run"} = "ampl";
$highlight_ext{"s4"} = "amtrix";
$highlight_ext{"s4t"} = "amtrix";
$highlight_ext{"s4h"} = "amtrix";
$highlight_ext{"hnd"} = "amtrix";
$highlight_ext{"t4"} = "amtrix";
$highlight_ext{"asm"} = "assembler";
$highlight_ext{"a51"} = "assembler";
$highlight_ext{"29k"} = "assembler";
$highlight_ext{"68s"} = "assembler";
$highlight_ext{"68x"} = "assembler";
$highlight_ext{"x86"} = "assembler";
$highlight_ext{"asm"} = "fasm";
$highlight_ext{"inc"} = "fasm";
$highlight_ext{"aspx"} = "asp";
$highlight_ext{"ashx"} = "asp";
$highlight_ext{"ascx"} = "asp";
$highlight_ext{"dats"} = "ats";
$highlight_ext{"was"} = "aspect";
$highlight_ext{"wud"} = "aspect";
$highlight_ext{"cmd"} = "bat";
$highlight_ext{"c++"} = "c";
$highlight_ext{"cpp"} = "c";
$highlight_ext{"cxx"} = "c";
$highlight_ext{"cc"} = "c";
$highlight_ext{"h"} = "c";
$highlight_ext{"hh"} = "c";
$highlight_ext{"hxx"} = "c";
$highlight_ext{"hpp"} = "c";
$highlight_ext{"cu"} = "c";
$highlight_ext{"CMakeLists.txt"} = "cmake";
$highlight_ext{"inp"} = "charmm";
$highlight_ext{"cfc"} = "coldfusion";
$highlight_ext{"cfm"} = "coldfusion";
$highlight_ext{"cob"} = "cobol";
$highlight_ext{"cbl"} = "cobol";
$highlight_ext{"anacrontab"} = "conf";
$highlight_ext{"patch"} = "diff";
$highlight_ext{"dockerfile"} = "docker";
$highlight_ext{"dtsi"} = "dts";
$highlight_ext{"e"} = "eiffel";
$highlight_ext{"se"} = "eiffel";
$highlight_ext{"ex"} = "elixir";
$highlight_ext{"exs"} = "elixir";
$highlight_ext{"hrl"} = "erlang";
$highlight_ext{"erl"} = "erlang";
$highlight_ext{"ex"} = "euphoria";
$highlight_ext{"exw"} = "euphoria";
$highlight_ext{"wxu"} = "euphoria";
$highlight_ext{"ew"} = "euphoria";
$highlight_ext{"eu"} = "euphoria";
$highlight_ext{"f"} = "fortran77";
$highlight_ext{"for"} = "fortran77";
$highlight_ext{"ftn"} = "fortran77";
$highlight_ext{"f95"} = "fortran90";
$highlight_ext{"f90"} = "fortran90";
$highlight_ext{"class"} = "gambas";
$highlight_ext{"gd"} = "gdscript";
$highlight_ext{"hs"} = "haskell";
$highlight_ext{"doxyfile"} = "ini";
$highlight_ext{"desktop"} = "ini";
$highlight_ext{"groovy"} = "java";
$highlight_ext{"grv"} = "java";
$highlight_ext{"jenkinsfile"} = "java";
$highlight_ext{"jsx"} = "js";
$highlight_ext{"jl"} = "julia";
$highlight_ext{"kt"} = "kotlin";
$highlight_ext{"b"} = "limbo";
$highlight_ext{"cl"} = "lisp";
$highlight_ext{"clisp"} = "lisp";
$highlight_ext{"el"} = "lisp";
$highlight_ext{"lsp"} = "lisp";
$highlight_ext{"sbcl"} = "lisp";
$highlight_ext{"scom"} = "lisp";
$highlight_ext{"fas"} = "lisp";
$highlight_ext{"scm"} = "lisp";
$highlight_ext{"mak"} = "make";
$highlight_ext{"mk"} = "make";
$highlight_ext{"makefile"} = "make";
$highlight_ext{"mib"} = "snmp";
$highlight_ext{"smi"} = "snmp";
$highlight_ext{"ml"} = "ocaml";
$highlight_ext{"mli"} = "ocaml";
$highlight_ext{"mod"} = "mod2";
$highlight_ext{"def"} = "mod2";
$highlight_ext{"m3"} = "mod3";
$highlight_ext{"i3"} = "mod3";
$highlight_ext{"ooc"} = "oberon";
$highlight_ext{"php3"} = "php";
$highlight_ext{"php4"} = "php";
$highlight_ext{"php5"} = "php";
$highlight_ext{"php6"} = "php";
$highlight_ext{"pmod"} = "pike";
$highlight_ext{"ff"} = "pl1";
$highlight_ext{"fp"} = "pl1";
$highlight_ext{"fpp"} = "pl1";
$highlight_ext{"rpp"} = "pl1";
$highlight_ext{"sf"} = "pl1";
$highlight_ext{"sp"} = "pl1";
$highlight_ext{"spb"} = "pl1";
$highlight_ext{"spp"} = "pl1";
$highlight_ext{"sps"} = "pl1";
$highlight_ext{"wp"} = "pl1";
$highlight_ext{"wf"} = "pl1";
$highlight_ext{"wpp"} = "pl1";
$highlight_ext{"wps"} = "pl1";
$highlight_ext{"wpb"} = "pl1";
$highlight_ext{"bdy"} = "pl1";
$highlight_ext{"spe"} = "pl1";
$highlight_ext{"pl"} = "perl";
$highlight_ext{"perl"} = "perl";
$highlight_ext{"cgi"} = "perl";
$highlight_ext{"pm"} = "perl";
$highlight_ext{"plx"} = "perl";
$highlight_ext{"plex"} = "perl";
$highlight_ext{"grm"} = "polygen";
$highlight_ext{"pro"} = "pro";
$highlight_ext{"pro"} = "qmake";
$highlight_ext{"p"} = "progress";
$highlight_ext{"i"} = "progress";
$highlight_ext{"w"} = "progress";
$highlight_ext{"rb"} = "ruby";
$highlight_ext{"ruby"} = "ruby";
$highlight_ext{"pp"} = "ruby";
$highlight_ext{"rjs"} = "ruby";
$highlight_ext{"gemfile"} = "ruby";
$highlight_ext{"rakefile"} = "ruby";
$highlight_ext{"rex"} = "rexx";
$highlight_ext{"rx"} = "rexx";
$highlight_ext{"the"} = "rexx";
$highlight_ext{"bash"} = "sh";
$highlight_ext{"zsh"} = "sh";
$highlight_ext{"ebuild"} = "sh";
$highlight_ext{"eclass"} = "sh";
$highlight_ext{"st"} = "smalltalk";
$highlight_ext{"gst"} = "smalltalk";
$highlight_ext{"sq"} = "smalltalk";
$highlight_ext{"sp"} = "sybase";
$highlight_ext{"wish"} = "tcl";
$highlight_ext{"itcl"} = "tcl";
$highlight_ext{"sty"} = "tex";
$highlight_ext{"cls"} = "tex";
$highlight_ext{"bas"} = "vb";
$highlight_ext{"basic"} = "vb";
$highlight_ext{"bi"} = "vb";
$highlight_ext{"vbs"} = "vb";
$highlight_ext{"v"} = "verilog";
$highlight_ext{"htm"} = "html";
$highlight_ext{"xhtml"} = "html";
$highlight_ext{"twig"} = "html";
$highlight_ext{"jinja"} = "html";
$highlight_ext{"sgm"} = "xml";
$highlight_ext{"sgml"} = "xml";
$highlight_ext{"nrm"} = "xml";
$highlight_ext{"ent"} = "xml";
$highlight_ext{"hdr"} = "xml";
$highlight_ext{"hub"} = "xml";
$highlight_ext{"dtd"} = "xml";
$highlight_ext{"glade"} = "xml";
$highlight_ext{"wml"} = "xml";
$highlight_ext{"vxml"} = "xml";
$highlight_ext{"wml"} = "xml";
$highlight_ext{"tld"} = "xml";
$highlight_ext{"csproj"} = "xml";
$highlight_ext{"xsl"} = "xml";
$highlight_ext{"ecf"} = "xml";
$highlight_ext{"jnlp"} = "xml";
$highlight_ext{"xsd"} = "xml";
$highlight_ext{"resx"} = "xml";
$highlight_ext{"fs"} = "fsharp";
$highlight_ext{"fsx"} = "fsharp";
$highlight_ext{"4gl"} = "informix";
$highlight_ext{"bb"} = "blitzbasic";
$highlight_ext{"iss"} = "innosetup";
$highlight_ext{"ls"} = "lotus";
$highlight_ext{"a4c"} = "ascend";
$highlight_ext{"as"} = "actionscript";
$highlight_ext{"exp"} = "express";
$highlight_ext{"hx"} = "haxe";
$highlight_ext{"pyx"} = "pyrex";
$highlight_ext{"abp"} = "abap4";
$highlight_ext{"cs"} = "csharp";
$highlight_ext{"ili"} = "interlis";
$highlight_ext{"lgt"} = "logtalk";
$highlight_ext{"m"} = "matlab";
$highlight_ext{"nsi"} = "nsis";
$highlight_ext{"nsh"} = "nsis";
$highlight_ext{"y"} = "bison";
$highlight_ext{"nut"} = "squirrel";
$highlight_ext{"lbn"} = "luban";
$highlight_ext{"mel"} = "maya";
$highlight_ext{"n"} = "nemerle";
$highlight_ext{"sc"} = "paradox";
$highlight_ext{"nrx"} = "netrexx";
$highlight_ext{"cb"} = "clearbasic";
$highlight_ext{"dot"} = "graphviz";
$highlight_ext{"sma"} = "small";
$highlight_ext{"au3"} = "autoit";
$highlight_ext{"chl"} = "chill";
$highlight_ext{"ahk"} = "autohotkey";
$highlight_ext{"fame"} = "fame";
$highlight_ext{"mo"} = "modelica";
$highlight_ext{"mpl"} = "maple";
$highlight_ext{"j"} = "jasmin";
$highlight_ext{"sno"} = "snobol";
$highlight_ext{"icn"} = "icon";
$highlight_ext{"flx"} = "felix";
$highlight_ext{"lsl"} = "lindenscript";
$highlight_ext{"ly"} = "lilypond";
$highlight_ext{"nas"} = "nasal";
$highlight_ext{"icl"} = "clean";
$highlight_ext{"bib"} = "bibtex";
$highlight_ext{"py"} = "python";
$highlight_ext{"text"} = "txt";
$highlight_ext{"ttl"} = "n3";
$highlight_ext{"nt"} = "n3";
$highlight_ext{"bfr"} = "biferno";
$highlight_ext{"sci"} = "scilab";
$highlight_ext{"sce"} = "scilab";
$highlight_ext{"nbs"} = "msl";
$highlight_ext{"yml"} = "yaml";
$highlight_ext{"vim"} = "vimscript";
$highlight_ext{"vimrc"} = "vimscript";
$highlight_ext{"pb"} = "purebasic";
$highlight_ext{"pbi"} = "purebasic";
$highlight_ext{"markdown"} = "md";
$highlight_ext{"clj"} = "clojure";
$highlight_ext{"lue"} = "lua";
