%%
%% This is file `vakaref.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% vakthesis.dtx  (with options: `vakaref')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from vakaref.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file vakthesis.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{vakaref}
  [2021/07/21 v0.09
   VAKU author's abstract document class (OMB)]
\def\@classname{vakaref}
\RequirePackage{xkeyval}
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright %FIXME: непотрібно, але потрібно для ток
\newif\if@draftmode
\newif\if@cthesis
\DeclareOptionX{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOptionX{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOptionX{a3paper}
   {\setlength\paperheight {420mm}%
    \setlength\paperwidth  {297mm}}
\DeclareOptionX{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOptionX{10pt}{\renewcommand\@ptsize{0}}
\DeclareOptionX{11pt}{\renewcommand\@ptsize{1}}
\DeclareOptionX{12pt}{\renewcommand\@ptsize{2}}
\DeclareOptionX{14pt}{\IfFileExists{size14.clo}%
  {\renewcommand\@ptsize{4}}%
  {\renewcommand\@ptsize{2}%
   \ClassError{\@classname}{You cannot use option `14pt'}%
     {File `size14.clo' not found.
      LaTeX package `extsizes' is not installed^^J%
      properly in your system.}}}
\DeclareOptionX{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOptionX{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOptionX{draft}{\@draftmodetrue\setlength\overfullrule{5pt}}
\DeclareOptionX{final}{\@draftmodefalse\setlength\overfullrule{0pt}}
\DeclareOptionX{titlepage}{\@titlepagetrue}
\DeclareOptionX{notitlepage}{\@titlepagefalse}
\DeclareOptionX{c}{\@cthesistrue
  \def\degreename{\cyrk\cyra\cyrn\cyrd\cyri\cyrd\cyra\cyrt}%
  \def\onesupervisorname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\
    \cyrk\cyre\cyrr\cyrii\cyrv\cyrn\cyri\cyrk}%
  \def\manysupervisorsname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyrii\
    \cyrk\cyre\cyrr\cyrii\cyrv\cyrn\cyri\cyrk\cyri}}
\DeclareOptionX{d}{\@cthesisfalse
  \def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr}%
  \def\onesupervisorname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\
    \cyrk\cyro\cyrn\cyrs\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrn\cyrt}%
  \def\manysupervisorsname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyrii\
    \cyrk\cyro\cyrn\cyrs\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrn\cyrt\cyri}}
\DeclareOptionX{guide}{%
  \IfFileExists{#1.clo}%
    {\AtEndOfClass{\input{#1.clo}}}%
    {\ClassError{\@classname}{You cannot use option `guide=#1'}%
       {File `#1.clo' not found.}}}
\DeclareOptionX*{\ClassError{\@classname}
  {Option `\CurrentOption' not supported}
  {Do not use option `\CurrentOption' please.}}
\ExecuteOptionsX{a5paper,10pt,twoside,final,c}
\ProcessOptionsX
\input{size1\@ptsize.clo}
\RequirePackage{ifthen}
\RequirePackage{indentfirst}
\RequirePackage{verbatim}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\def\ps@plain{\let\@mkboth\@gobbletwo
  \def\@oddhead{\small\hfil\thepage\hfil}%
  \def\@evenhead{\small\hfil\thepage\hfil}
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\if@draftmode
  \let\ps@draft\ps@plain
  \g@addto@macro\ps@draft{\def\chaptermark#1{\markboth{#1}{#1}}%
    \def\@oddfoot{\scriptsize \draftname\ $\circ$\ \today\hfil \rightmark}%
    \def\@evenfoot{\scriptsize \leftmark\hfil \draftname\ $\circ$\ \today}}
  \let\ps@plain\ps@draft
  \def\draftname{Draft Version}%
  \AtBeginDocument{%
    \@ifpackageloaded{babel}{\addto\captionsukrainian{%
    \def\draftname{{\cyr\CYRCH\cyre\cyrr\cyrn\cyre\cyrt\cyrk\cyra}}}%
    }{}%
  }
\fi
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ %
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
\def\@nocmdgiven#1{%
  \ClassError{\@classname}
  {No \protect#1 given}
  {Use command \protect#1 in your document.}}
\newcommand{\placeholder}[1][100pt]{\rule{#1}{0.4pt}}
%%\renewcommand{\title}[1]{\def\@title{#1}}
\def\@title{<\CYRN\cyra\cyrz\cyrv\cyra\
  \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi>%
  \@nocmdgiven{\title}}
%%\renewcommand{\author}[1]{\def\@author{#1}}
\def\@author{<\CYRP\cyrr\cyrii\cyrz\cyrv\cyri\cyrshch\cyre{}
  \CYRII\cyrm'\cyrya\
  \CYRP\cyro\ \cyrb\cyra\cyrt\cyrsftsn\cyrk\cyro\cyrv\cyrii>%
  \@nocmdgiven{\author}}
\newcounter{@supervisors@count}
\newcommand{\supervisor}[3]{%
  \stepcounter{@supervisors@count}%
  \ifnum\value{@supervisors@count}=1
    \def\@supervisors{\\{#1}{#2}{#3}}%
  \else
    \g@addto@macro\@supervisors{\\{#1}{#2}{#3}}%
  \fi}
\if@cthesis
  \def\@supervisors{\@nocmdgiven{\supervisor}%
    \\{<\CYRP\cyrr\cyrii\cyrz\cyrv\cyri\cyrshch\cyre\
       \CYRII\cyrm'\cyrya\ \CYRP\cyro\ \cyrb\cyra\cyrt\cyrsftsn\cyrk\cyro\cyrv\cyrii>}%
      {<\cyrn\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\ \cyrs\cyrt\cyru\cyrp\cyrii\cyrn\cyrsftsn,
       \cyrv\cyrch\cyre\cyrn\cyre\ \cyrz\cyrv\cyra\cyrn\cyrn\cyrya>}%
      {<\cyrm\cyrii\cyrs\cyrc\cyre\ \cyrr\cyro\cyrb\cyro\cyrt\cyri, \cyrp\cyro\cyrs\cyra\cyrd\cyra>}%
  }%
\else
  \let\@supervisors\@empty
\fi
\def\oneopponentname{\CYRO\cyrf\cyrii\cyrc\cyrii\cyrishrt\cyrn\cyri\cyrishrt\
  \cyro\cyrp\cyro\cyrn\cyre\cyrn\cyrt}
\def\manyopponentsname{\CYRO\cyrf\cyrii\cyrc\cyrii\cyrishrt\cyrn\cyrii\
  \cyro\cyrp\cyro\cyrn\cyre\cyrn\cyrt\cyri}
\newcounter{@opponents@count}
\newcommand{\opponent}[3]{%
  \stepcounter{@opponents@count}%
  \ifnum\value{@opponents@count}=1
    \def\@opponents{\\{#1}{#2}{#3}}%
  \else
    \g@addto@macro\@opponents{\\{#1}{#2}{#3}}%
  \fi}
\def\@opponents{\@nocmdgiven{\opponent}%
  \\{<\CYRP\cyrr\cyrii\cyrz\cyrv\cyri\cyrshch\cyre\
     \CYRII\cyrm'\cyrya\ \CYRP\cyro\ \cyrb\cyra\cyrt\cyrsftsn\cyrk\cyro\cyrv\cyrii>}%
    {<\cyrn\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\ \cyrs\cyrt\cyru\cyrp\cyrii\cyrn\cyrsftsn,
     \cyrv\cyrch\cyre\cyrn\cyre\ \cyrz\cyrv\cyra\cyrn\cyrn\cyrya>}%
    {<\cyrm\cyrii\cyrs\cyrc\cyre\ \cyrr\cyro\cyrb\cyro\cyrt\cyri,
     \cyrp\cyro\cyrs\cyra\cyrd\cyra>}}
\def\specialityfilename{speciality.20070212N70}
\def\speciality{\@ifnextchar[\n@speciality\n@specialitya}
\def\n@speciality[#1]{%
  \def\@specialityname{#1}%
  \@speciality}
\def\@speciality#1{%
  \@parse@speciality#1.\@nil
  \def\@specialitycode{\@speca.\@specb.\@specc}%
  \@ifnextchar[\ns@speciality\s@specialitya}
\def\ns@speciality[#1]{\def\@science{#1}}
\def\s@specialitya{%
  \@find@speciality
  \def\@science{\expandafter\@afterslash\@found\@nil}}
\def\n@specialitya#1{%
  \@parse@speciality#1.\@nil
  \def\@specialitycode{\@speca.\@specb.\@specc}%
  \@ifnextchar[\s@speciality\ns@specialitya}
\def\s@speciality[#1]{%
  \def\@science{#1}%
  \@find@speciality
  \def\@specialityname{\expandafter\@beforeslash\@found\@nil}}
\def\ns@specialitya{%
  \@find@speciality
  \def\@specialityname{\expandafter\@beforeslash\@found\@nil}%
  \def\@science{\expandafter\@afterslash\@found\@nil}}
\def\@find@speciality{%
  \findinfile{\specialityfilename}{\@specialitycode}%
  \ifthenelse{\equal{\@found}{}}
  {\def\@found{<\cyrn\cyra\cyrishrt\cyrm\cyre\cyrn\cyru\cyrv\cyra\cyrn\cyrn\cyrya\
     \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyro\cyrs\cyrt\cyrii>%
     \ClassError{\@classname}{Unknown speciality code (speciality name)}
     {I can not determinate speciality name.\MessageBreak
      Command \protect\speciality\space has two optional arguments. Use them please.}/%
     <\cyrg\cyra\cyrl\cyru\cyrz\cyrsftsn\ \cyrn\cyra\cyru\cyrk>%
     \ClassError{\@classname}{Unknown speciality code (science)}
     {I can not determinate science.\MessageBreak
      Command \protect\speciality\space has two optional arguments. Use them please.}}}
  {\relax}}
\def\@specialitycode{<\cyrsh\cyri\cyrf\cyrr\
  \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyro\cyrs\cyrt\cyrii>%
  \@nocmdgiven{\speciality}}
\def\@specialityname{%
  <\cyrn\cyra\cyrishrt\cyrm\cyre\cyrn\cyru\cyrv\cyra\cyrn\cyrn\cyrya\
  \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyro\cyrs\cyrt\cyrii>}
\def\@science{<\cyrg\cyra\cyrl\cyru\cyrz\cyrsftsn\ \cyrn\cyra\cyru\cyrk>}
\def\@parse@speciality#1.#2.#3.#4\@nil{%
  \def\@speca{#1}%
  \def\@specb{#2}%
  \def\@specc{#3}}
\newread\@specialityfile
\def\findinfile#1#2{%
  \def\@required{#2}%
  \def\@found{}%
  \openin\@specialityfile #1\relax
  \ifeof\@specialityfile
    \typeout{No file #1.}
  \else
    \@addtofilelist{#1}
    \ProvidesFile{#1}[(\@classname)]
    \@readline
  \fi
  \closein\@specialityfile}
\def\@readline{%
  \read\@specialityfile to\@currline
  \ifeof\@specialityfile
  \else
    \expandafter\test\@currline\@nil
    \next
  \fi}
\def\test#1\@nil{%
  \let\next\@readline
  \def\@temp{#1}%
  \ifx\@temp\@empty \else\@test#1\@nil \fi}
\def\@test#1 #2\@nil{%
  \ifthenelse{\equal{\@required}{#1}}
  {\def\@found{#2}\let\next\relax}
  {}}
\def\@beforeslash#1/#2\@nil{#1}
\def\@afterslash#1/#2\@nil{#2}
\newcommand{\udc}[1]{\def\@udc{#1}}
\def\@udc{<\cyrii\cyrn\cyrd\cyre\cyrk\cyrs\ \CYRU\CYRD\CYRK>}
\newcommand{\institution}[1]{\@split@institution#1,,\@nil}
\def\@split@institution#1,#2,#3\@nil{%
  \def\@institution{#1}%
  \def\@institution@office{\ignorespaces
  #2}}
\def\@institution{<\CYRN\cyra\cyrz\cyrv\cyra\
  \cyro\cyrr\cyrg\cyra\cyrn\cyrii\cyrz\cyra\cyrc\cyrii\cyryi,\
  \cyrv\ \cyrya\cyrk\cyrii\cyrishrt\
  \cyrv\cyri\cyrk\cyro\cyrn\cyra\cyrn\cyra\
  \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrya>}
\def\@institution@office{\ignorespaces}
%% Синтаксис команди
%% \council{шифр ради}[установа, відомство]{назва установи}{адреса}
\newcommand{\council}[1]{\catcode`м=11
  \def\@council@code{#1}%
  \@ifnextchar[\o@council\@council}
\def\o@council[#1,#2]#3#4{%
  \def\@council@institutiont{#1}%
  \def\@council@institutiont@office{#2}%
  \@council{#3}{#4}}
\def\@council#1#2{%
  \def\@council@institution{#1}%
  \def\@council@address{#2}%
  \@extracttown#2\@nil}
\def\@extracttown#1.#2,#3\@nil{%
  \global\def\@town{\ignorespaces
    \@ifnextchar~{\@gobble}{\relax}#2}}
\def\@council@code{<\cyrsh\cyri\cyrf\cyrr\ \cyrr\cyra\cyrd\cyri>}
\def\@council@institution{<\CYRN\cyra\cyrz\cyrv\cyra\ \cyru\cyrs\cyrt\cyra\cyrn\cyro\cyrv\cyri,
  \cyrv\ \cyrya\cyrk\cyrii\cyrishrt\ \cyrs\cyrt\cyrv\cyro\cyrr\cyre\cyrn\cyra\ \cyrr\cyra\cyrd\cyra>}
\def\@council@address{<\cyra\cyrd\cyrr\cyre\cyrs\cyra>}
\newcommand{\secretary}[1]{\def\@secretary{#1}}
\def\@town{<\CYRM\cyrii\cyrs\cyrt\cyro>}
%% Синтаксис команди
%% \library{назва}{адреса}
\newcommand{\library}[2]{%
  \def\@library@institution{#1}%
  \def\@library@address{#2}}
\def\@library@institution{}
%% Синтаксис команди
%% \linstitution{назва, підрозділ, відомство}{місто}
%% або
%% \linstitution{назва, відомство}{місто}
\newcommand{\linstitution}[2]{%
  \def\@linstitution{#1}%
  \def\@linstitution@town{#2}}
%% Синтаксис команди
%% \defencedate{YYYY/MM/DD}{TT:MM}
%% \postdate{YYYY/MM/DD}
\newcommand\defencedate[2]{%
  \@split@date#1\@nil
  \def\@defencedate{#1}%
  \def\@defencetime{#2}}
\def\@split@date#1/#2/#3\@nil{\def\@year{#1}}
\newcommand\postdate[1]{\def\@postdate{#1}}
\def\typedate#1/#2/#3\@nil{<<\number#3>>~\ifcase#2\or
  \cyrs\cyrii\cyrch\cyrn\cyrya\or
  \cyrl\cyryu\cyrt\cyro\cyrg\cyro\or
  \cyrb\cyre\cyrr\cyre\cyrz\cyrn\cyrya\or
  \cyrk\cyrv\cyrii\cyrt\cyrn\cyrya\or
  \cyrt\cyrr\cyra\cyrv\cyrn\cyrya\or
  \cyrch\cyre\cyrr\cyrv\cyrn\cyrya\or
  \cyrl\cyri\cyrp\cyrn\cyrya\or
  \cyrs\cyre\cyrr\cyrp\cyrn\cyrya\or
  \cyrv\cyre\cyrr\cyre\cyrs\cyrn\cyrya\or
  \cyrzh\cyro\cyrv\cyrt\cyrn\cyrya\or
  \cyrl\cyri\cyrs\cyrt\cyro\cyrp\cyra\cyrd\cyra\or
  \cyrg\cyrr\cyru\cyrd\cyrn\cyrya\fi
  \space\number#1~\cyrr.}
\def\typedateholder{<<\placeholder[5mm]>>~\placeholder[25mm]\ \@year~\cyrr.}
\def\typetime#1:#2\@nil{#1\ifnum#2=0\ \cyrg\cyro\cyrd\cyri\cyrn\cyrii\else\textsuperscript{#2}\fi}
\def\typetimeholder{\placeholder[5mm]\ \cyrg\cyro\cyrd\cyri\cyrn\cyrii}
\def\@year{\the\year}
\newcommand\manuscript{\def\@thesistype{\cyrr\cyru\cyrk\cyro\cyrp\cyri\cyrs}}
\newcommand\monograph{\def\@thesistype{\cyrm\cyro\cyrn\cyro\cyrg\cyrr\cyra\cyrf\cyrii\cyrya}}
\manuscript
\newenvironment{listofpersons}[1]
  {\list{#1\hfil}{\topsep0pt\parsep0pt\itemsep.5\parskip
   \ifx\@supervisors\@empty
     \settowidth\@tempdima{#1}%
     \setlength\labelwidth{\@tempdima}%
   \else
     \settowidth\@tempdima{\@supervisors@caption}
     \settowidth\@tempdimb{\@opponents@caption}
     \ifdim\@tempdima>\@tempdimb
       \setlength\labelwidth{\@tempdima}%
     \else
       \setlength\labelwidth{\@tempdimb}%
     \fi
   \fi
   \setlength\leftmargin{\labelwidth}%
   \addtolength\leftmargin{\labelsep}%
   \def\makelabel##1{##1}%
   \def\makephantomlabel##1{\phantom{##1}}}%
   \rightskip\@flushglue% ! нерівний правий край, але при дуже вузькій колонці погано
                        % ? можуть виникати Underfull \hbox
  }
  {\endlist}
\newcommand{\maketitle}{%
    \begin{titlepage}%
    \@ifundefined{@council@institutiont}
      {\let\@council@institutiont\@council@institution}{\relax}%
    \@ifundefined{@council@institutiont@office}
      {\let\@council@institutiont@office\relax}{\relax}%
    \begin{center}%
    \@makecover
    \end{center}%
    \newpage
    \parindent=0pt\relax
    \parskip=10pt plus 10pt minus 10pt
    \@makereverse
    \end{titlepage}%
}
\def\@makecover{%
  {\scshape\@council@institutiont@office\par\@council@institutiont\par}
  \vspace{\stretch{3}}%
  {\bfseries\expandafter\emphsurname\@author \par}%
  \vspace{\stretch{2}}%
  {\raggedleft \CYRU\CYRD\CYRK\ \@udc \par}%
  \vspace{\stretch{1}}%
  {\large\bfseries\scshape \@title \par}%
  \vspace{\stretch{2}}%
  \@specialitycode\ --- \@specialityname\par
  \vspace{\stretch{3}}%
  \CYRA\cyrv\cyrt\cyro\cyrr\cyre\cyrf\cyre\cyrr\cyra\cyrt\linebreak[1]%
  \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi\
    \cyrn\cyra\ \cyrz\cyrd\cyro\cyrb\cyru\cyrt\cyrt\cyrya\
    \cyrn\cyra\cyru\cyrk\cyro\cyrv\cyro\cyrg\cyro\
    \cyrs\cyrt\cyru\cyrp\cyre\cyrn\cyrya\linebreak[1]%
    \degreename\cyra\ \@science\par%?\linebreak[1]%
  \vspace{\stretch{3}}%
  \@town\ --- \@year}
\def\@makereverse{%
  \CYRD\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrie\cyryu\
    \cyrie\ \@thesistype.\par
  \CYRR\cyro\cyrb\cyro\cyrt\cyra\
    \cyrv\cyri\cyrk\cyro\cyrn\cyra\cyrn\cyra\ \cyrv\
    \transformsentence{L}{\@institution}
    \if\@institution@office\ignorespaces
    \else\
    \transformsentence{G}{\@institution@office}
    \fi
    .\par
  {\let\\\@format@person
   \ifx\@supervisors\@empty
   \else
     \begin{listofpersons}{\@supervisors@caption}
       \@supervisors\relax
     \end{listofpersons}
   \fi
   \begin{listofpersons}{\@opponents@caption}
     \@opponents\relax
   \end{listofpersons}}%
  \@ifundefined{@linstitution}{}{%
    \CYRP\cyrr\cyro\cyrv\cyrii\cyrd\cyrn\cyra\ \cyru\cyrs\cyrt\cyra\cyrn\cyro\cyrv\cyra:\
    \@linstitution, \@linstitution@town.\par}
  \vfill%\vspace{30pt plus 30pt minus 30pt}%
  \CYRZ\cyra\cyrh\cyri\cyrs\cyrt\
    \cyrv\cyrii\cyrd\cyrb\cyru\cyrd\cyre\cyrt\cyrsftsn\cyrs\cyrya\
    \@ifundefined{@defencedate}{\typedateholder}
      {\expandafter\typedate\@defencedate\@nil}%
    \ \cyro\
    \@ifundefined{@defencetime}{\typetimeholder}
      {\expandafter\typetime\@defencetime\@nil}%
\ \cyrn\cyra\ \cyrz\cyra\cyrs\cyrii\cyrd\cyra\cyrn\cyrn\cyrii\
    \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrii\cyrz\cyro\cyrv\cyra\cyrn\cyro\cyryi\
    \cyrv\cyrch\cyre\cyrn\cyro\cyryi\ \cyrr\cyra\cyrd\cyri\
    \@council@code\ \transformsentence{G}{\@council@institution}
    \ \cyrz\cyra\ \cyra\cyrd\cyrr\cyre\cyrs\cyro\cyryu:
    \@council@address.\par
  \vfil%\smallskip
  \ifx\@library@institution\@empty
    \let\@library@institution\@council@institution
  \fi
  \CYRZ\ \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrie\cyryu\
    \cyrm\cyro\cyrzh\cyrn\cyra\
    \cyro\cyrz\cyrn\cyra\cyrishrt\cyro\cyrm\cyri\cyrt\cyri\cyrs\cyrsftsn\
    \cyru\ \cyrb\cyrii\cyrb\cyrl\cyrii\cyro\cyrt\cyre\cyrc\cyrii\
    \transformsentence{G}{\@library@institution}
    \@ifundefined{@library@address}{.\par}
      {\ \cyrz\cyra\ \cyra\cyrd\cyrr\cyre\cyrs\cyro\cyryu:
       \@library@address.\par}
  \vfill%\vspace{10pt plus 10pt minus 10pt}%
  \CYRA\cyrv\cyrt\cyro\cyrr\cyre\cyrf\cyre\cyrr\cyra\cyrt\
    \cyrr\cyro\cyrz\cyrii\cyrs\cyrl\cyra\cyrn\cyri\cyrishrt\
    \@ifundefined{@postdate}{\typedateholder}
      {\expandafter\typedate\@postdate\@nil}\par
  \vfill%\vspace{20pt plus 20pt minus 20pt}%
  \CYRU\cyrch\cyre\cyrn\cyri\cyrishrt\
  \cyrs\cyre\cyrk\cyrr\cyre\cyrt\cyra\cyrr\newline
  \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrii\cyrz\cyro\cyrv\cyra\cyrn\cyro\cyryi\
  \cyrv\cyrch\cyre\cyrn\cyro\cyryi\ \cyrr\cyra\cyrd\cyri\hfill
  %\placeholder{\cyrp\cyrii\cyrd\cyrp\cyri\cyrs}\quad
  \@secretary\par}
\def\@supervisors@caption{%
  \ifnum\value{@supervisors@count}>1
    \manysupervisorsname:%
  \else
    \onesupervisorname:% символ : додано на вимогу спецради
  \fi}
\def\@opponents@caption{%
  \ifnum\value{@opponents@count}>1
    \manyopponentsname:%
  \else
    \oneopponentname:% символ : додано за аналогією з наук. кер.
  \fi}
\def\@format@person#1#2#3{\item
  \@@format@person#2\newline \textbf{#1},\newline
  \@@format@person#3\let\makelabel\makephantomlabel
  \futurelet\next\@delimit@person}
\def\@@format@person#1,#2{#1, #2}
\def\@delimit@person{\ifx\relax\next.\else;\fi}
\def\emphsurname#1 #2{\textsc{#1} #2}
\def\secdef#1#2{\@ifstar{\@dblarg{#2}}{\@dblarg{#1}}}
\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{-2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\def\@make@chapapp#1{\let\\\protected@dblbs\MakeUppercase{#1}}
\def\protected@dblbs{\noexpand\linebreak}
\newcommand\part{%
  \secdef\@part\@spart}
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{#1}{#1}%
    \vskip 15\p@
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \normalsize\bfseries \@make@chapapp{\partname}\nobreakspace\thepart
       \par\nobreak
     \fi
     \normalsize \bfseries \@make@chapapp{#2}\par\nobreak}%
    \vskip 9\p@}
\def\@spart[#1]#2{%
    \addcontentsline{toc}{part}{#1}%
    \markboth{#1}{#1}%
    \vskip 15\p@
    {\centering
     \interlinepenalty \@M
     \normalfont
     \normalsize \bfseries \@make@chapapp{#2}\par\nobreak}%
    \vskip 9\p@}
\AtBeginDocument{%
  \@ifpackageloaded{hyperref}{%
    \def\@spart[#1]#2{%
      \Hy@MakeCurrentHrefAuto{part*}%
      \Hy@raisedlink{%
        \hyper@anchorstart{\@currentHref}\hyper@anchorend
      }%
      \H@old@spart[#1]{#2}%
    }%
    \Hy@AtBeginDocument{%
      \@ifpackageloaded{nameref}{%
        \long\def\@spart[#1]#2{%
          \NR@gettitle{#2}%
          \NR@spart[#1]{#2}%
        }%
      }{}%
    }%
  }{}%
}
\newcommand\paragraph{\@startsection{paragraph}{4}{\parindent}%
                                    {1ex \@plus .2ex \@minus .1ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {1ex \@plus .2ex \@minus .1ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\itshape}}
%% означено в latex.ltx
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@dblarg{\@ssect{#1}{#3}{#4}{#5}{#6}}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8\@addpunct{.}\@nopunctnoskip{#5}}% крапка після заголовка у підбір. команда з amsgen. перевіряти? немає пропуска, якщо немає знаків пунктуації
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@seccntformat#1{\csname the#1\endcsname.\enskip}
\def\@ssect#1#2#3#4#5[#6]#7{%
  \@tempskipa #4\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #5{%
        \@hangfrom{\hskip #2}%
          \interlinepenalty \@M #7\@@par}%
    \endgroup
    \csname #1mark\endcsname{#6}%
    \addcontentsline{toc}{#1}{#6}%
  \else
    \def\@svsechd{#5{\hskip #2\relax #7\@addpunct{.}\@nopunctnoskip{#4}}%
      \csname #1mark\endcsname{#6}%
      \addcontentsline{toc}{#1}{#6}}%
  \fi
  \@xsect{#4}}
\AtBeginDocument{%
  \@ifpackageloaded{hyperref}{%
    \def\@ssect#1#2#3#4#5[#6]#7{%
      \Hy@MakeCurrentHrefAuto{section*}%
      \setlength{\Hy@SectionHShift}{#2}%
      \begingroup
        \toks@{\H@old@ssect{#1}{#2}{#3}{#4}{#5}[#6]}%
        \toks\tw@\expandafter{%
          \expandafter\Hy@SectionAnchorHref\expandafter{\@currentHref}%
          #7%
        }%
      \edef\x{\endgroup
        \the\toks@{\the\toks\tw@}%
      }\x
    }%
    \Hy@AtBeginDocument{%
      \@ifpackageloaded{nameref}{%
        \def\@ssect#1#2#3#4#5[#6]#7{%
          \NR@gettitle{#7}%
          \NR@ssect{#1}{#2}{#3}{#4}{#5}[#6]{\Sectionformat{#7}{#2}}%
        }%
      }{}%
    }%
  }{}%
}
\def\@addpunct#1{%
  \relax\ifhmode
    \ifnum\spacefactor>\@m \else#1\fi
  \fi}
\def\nopunct{\spacefactor 1007 }
\def\@nopunctnoskip#1{\ifnum\spacefactor=1007 \ \hskip#1\fi}
\def\frenchspacing{\sfcode`\.1006\sfcode`\?1005\sfcode`\!1004%
  \sfcode`\:1003\sfcode`\;1002\sfcode`\,1001 }
\AtBeginDocument{%
  \setlength\labelsep{.5em}%
  \setcounter{enumi}{88}%    88.
  \setcounter{enumii}{8}%     ж)
  \setcounter{enumiii}{8}% VIII.
  \setcounter{enumiv}{8}%     Ж.
  \settowidth\leftmargini{\labelenumi\hskip\labelsep}%
  \addtolength\leftmargini{\parindent}%
  \settowidth\leftmarginii{\labelenumii\hskip\labelsep}%
  \settowidth\leftmarginiii{\labelenumiii\hskip\labelsep}%
  \settowidth\leftmarginiv{\labelenumiv\hskip\labelsep}%
  \setcounter{enumi}{0}\setcounter{enumii}{0}%
  \setcounter{enumiii}{0}\setcounter{enumiv}{0}%
  \setlength\leftmarginv{1.5em}%
  \leftmarginvi\leftmarginv
  \leftmargin\leftmargini
  \setlength\labelwidth{\leftmargini}%
  \addtolength\labelwidth{-\labelsep}%
  \@listi}
\setlength\partopsep{\z@skip}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\def\@listi{\leftmargin\leftmargini
            \parsep  \parskip
            \topsep  \z@skip
            \itemsep \z@skip}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    \z@skip
              \parsep    \z@skip
              \partopsep \z@skip
              \itemsep   \z@skip}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep}
\let\@savsmall\small
\renewcommand\small{%
  \@savsmall
  \let\@listi\@listI}
\let\@savfootnotesize\footnotesize
\renewcommand\footnotesize{%
  \@savfootnotesize
  \let\@listi\@listI}
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{{\cyr\@asbuk\c@enumii}}
\renewcommand\theenumiii{\@Roman\c@enumiii}
\renewcommand\theenumiv{{\cyr\@Asbuk\c@enumiv}}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi\theenumii\nobreakspace}
\renewcommand\p@enumiv{\p@enumiii\theenumiii\nobreakspace}
\newcommand\labelitemi{\normalfont\bfseries \textemdash}
\newcommand\labelitemii{\textbullet}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\AtBeginDocument{%
\@ifpackageloaded{enumerate}{% якщо підключено enumerate
  \def\@@enum@[#1]{%
    \@enLab{}\let\@enThe\@enQmark
    \@enloop#1\@enum@
    \ifx\@enThe\@enQmark\@warning{The counter will not be printed.%
     ^^J\space\@spaces\@spaces\@spaces The label is: \the\@enLab}\fi
    \expandafter\edef\csname label\@enumctr\endcsname{\the\@enLab}%
    \expandafter\let\csname the\@enumctr\endcsname\@enThe
    \@enum@}%
  \def\@enum@{\list{\csname label\@enumctr\endcsname}%
             {\usecounter{\@enumctr}\def\makelabel##1{\hss\llap{\upshape##1}}}}%
}{% якщо не підключено enumerate
  \def\enumerate{%
    \ifnum \@enumdepth >\thr@@\@toodeep\else
      \advance\@enumdepth\@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
        \expandafter
        \list
          \csname label\@enumctr\endcsname
          {\usecounter\@enumctr\def\makelabel##1{\hss\llap{\upshape##1}}}%
    \fi}%
}}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{\upshape##1}}}%
  \fi}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@titlepage
  \newenvironment{titlepage}
    {\newpage
     \pagestyle{empty}%
     \setcounter{page}{1}}%
    {\newpage
     \setcounter{page}{1}}
\else
  \renewcommand\maketitle{\newpage
    \setcounter{page}{1}%
  }%
  \newenvironment{titlepage}
    {\maketitle
     \comment}%
    {\endcomment}
\fi
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{htbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{htbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\tablenamefont{\itshape}
\def\fnum@table{{\tablenamefont\tablename\/}\nobreakspace\thetable}
\newenvironment{table}
               {\let\@makecaption\@maketablecaption
                \@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
%% Підписи до малюнків Рис. 1.1  Назва
%% ідею \CaptionSeparator запозичено з frenchb.ldf / тепер там по-іншому?
\AtBeginDocument{\def\CaptionSeparator{\string.\space}}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\CaptionSeparator #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1\CaptionSeparator #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\def\tablecaptionfont{\bfseries}
\long\def\@maketablecaption#1#2{%
  \vskip\belowcaptionskip
  \raggedleft#1\par
  \sbox\@tempboxa{\tablecaptionfont#2}%
  \ifdim \wd\@tempboxa >\hsize
    \centering\tablecaptionfont#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\abovecaptionskip}
\AtBeginDocument{%
  \@ifpackageloaded{longtable}{%
    \let\@savlongtable\longtable
    \def\longtable{%
      \setlength\LTcapwidth\hsize
      \@savlongtable}%
    \def\LT@makecaption#1#2#3{%
      \LT@mcol\LT@cols c{\hbox to\z@{\hss\parbox[t]\LTcapwidth{\normalsize
        \raggedleft#1{#2}\par
        \sbox\@tempboxa{\tablecaptionfont#3}%
        \ifdim\wd\@tempboxa>\hsize
          \centering\tablecaptionfont#3%
        \else
          \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
        \fi
        \endgraf\vskip.5\baselineskip}%
      \hss}}}%
  }{}
  \@ifpackageloaded{float}{%
    \renewcommand\floatc@plain[2]{\setbox\@tempboxa\hbox{{\@fs@cfont #1\CaptionSeparator}#2}%
      \ifdim\wd\@tempboxa>\hsize {\@fs@cfont #1\CaptionSeparator}#2\par
        \else\hbox to\hsize{\hfil\box\@tempboxa\hfil}\fi}%
  }{}
}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{-1}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \@tocheader{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }
\newcommand\@tocheader[1]{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \global\@topnum\z@
  \@afterindenttrue
  \vskip 15\p@
  {\centering
   \interlinepenalty \@M
   \normalfont
   \normalsize \bfseries \@make@chapapp{#1}\par
   \vskip 9\p@}%
}
\def\@starttoc#1{%
  \begingroup
    \let\\\@tocdblbs
    \makeatletter
    \@input{\jobname.#1}%
    \if@filesw
      \expandafter\newwrite\csname tf@#1\endcsname
      \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
    \fi
    \@nobreakfalse
  \endgroup}
\def\@tocdblbs{\unskip\ \@ifstar\@xtocdblbs\@xtocdblbs}
\def\@xtocdblbs{\@ifnextchar[\@gobble@oparg\ignorespaces}
\def\@gobble@oparg[#1]{\ignorespaces}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{1.0ex \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@tocrmarg
      \parfillskip -\rightskip
      {\leavevmode
       #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
\let\l@table\l@figure
\def\numberline#1{\hb@xt@\@tempdima{\mdseries#1.\hfil}}
\newdimen\bibindent
\setlength\bibindent{1.5em}
%% Означено в latex.ltx
\def\bibliographystyle#1{%
  \ifx\@begindocumenthook\@undefined\else
    \expandafter\AtBeginDocument
  \fi
    {\if@filesw
       \immediate\write\@auxout{\string\bibstyle{#1}}%
     \fi}%
  \ifthenelse
  {\equal{#1}{plain}\or
   \equal{#1}{unsrt}\or
   \equal{#1}{abbrv}\or
   \equal{#1}{amsplain}\or
   \equal{#1}{gost71s}\or
   \equal{#1}{gost71u}\or
   \equal{#1}{gost780s}\or
   \equal{#1}{gost780u}% \or
  }
  {\def\@biblabel##1{##1.}}
  {\def\@biblabel##1{[##1]}}}
\def\@biblabel#1{#1.}
%% Два списки літератури: Список використаних джерел
%%                        Список публікацій автора
%% \@bibmark --- мітка, яка з'являється біля номера (мітки) у
%% списку літератури і в посиланнях
\def\@bibmark{}
\newenvironment{thebibliography}[1]
     {\part{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv\@bibmark}}%
           {\settowidth\labelwidth{\@biblabel{#1\@bibmark}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv\@bibmark}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
     }
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcounter{needbibset}
\setcounter{needbibset}{1}
\newcounter{currbibset}
%% Синтаксис
%% \begin{bibset}[<мітка1>]{<Назва1>}
%% \bibliographystyle{<стиль>}
%% \bibliography{<.bib-файл>}
%% \end{bibset}
%% \begin{bibset}[<мітка2>]{<Назва2>}
%% \bibliographystyle{<стиль>}
%% \bibliography{<.bib-файл>}
%% \end{bibset}
\newenvironment{bibset}[2][]
  {\stepcounter{currbibset}%
   \def\@temp{#1}%
   \ifx\@temp\@empty
     \def\@bibmark{\relax}%FIXME: \def\@bibmark{} не працює
   \else
     \def\@bibmark{\textsuperscript{#1}}%
   \fi
   \let\@sav@lbibitem\@lbibitem
   \def\@lbibitem[##1]##2{\@sav@lbibitem[##1\@bibmark]{##2}}%
   \@ifundefined{Hy@WarningNoLine}
%% якщо не підключений пакет hyperref
     {\def\@bibitem##1{\item\if@filesw \immediate\write\@auxout
        {\string\bibcite{##1}{\the\value{\@listctr}\expandafter\string\@bibmark}}%
        \fi\ignorespaces}}
%% якщо підключений пакет hyperref
     {\def\@bibitem##1{%
        \@skiphyperreftrue\H@item\@skiphyperreffalse
        \Hy@raisedlink{%
          \hyper@anchorstart{cite.##1\@extra@b@citeb}\relax\hyper@anchorend
        }%
        \if@filesw
          \begingroup
            \let\protect\noexpand
            \immediate\write\@auxout{%
              \string\bibcite{##1}{\the\value{\@listctr}\expandafter\string\@bibmark}%
            }%
          \endgroup
        \fi
        \ignorespaces
      }}%
   \def\bibname{#2}%
   \let\bibliography\@thisbibliography
   \let\bibliographystyle\@thisbibliographystyle}
  {\ifnum\thecurrbibset=\theneedbibset
     \ifnum\theneedbibset=1
       \immediate\write\@auxout{\string\setcounter{needbibset}{2}}%
     \else
       \immediate\write\@auxout{\string\setcounter{needbibset}{1}}%
     \fi
   \fi}
\def\@thisbibliography#1{%
  \if@filesw
    \ifnum\thecurrbibset=\theneedbibset
      \immediate\write\@auxout{\string\bibdata{#1}}%
    \else
      \immediate\write\@auxout{\@percentchar\string\bibdata{#1}}%
    \fi
  \fi
  \@input@{\jobname\thecurrbibset.bbl}}
\def\@thisbibliographystyle#1{%
  \ifx\@begindocumenthook\@undefined\else
    \expandafter\AtBeginDocument
  \fi
    {\if@filesw
       \ifnum\thecurrbibset=\theneedbibset
         \immediate\write\@auxout{\string\bibstyle{#1}}%
       \else
         \immediate\write\@auxout{\@percentchar\string\bibstyle{#1}}%
       \fi
     \fi}%
%% нумерація літератури 1.
  \ifthenelse
  {\equal{#1}{plain}\or
   \equal{#1}{unsrt}\or
   \equal{#1}{abbrv}\or
   \equal{#1}{amsplain}\or
   \equal{#1}{gost71s}\or
   \equal{#1}{gost71u}\or
   \equal{#1}{gost780s}\or
   \equal{#1}{gost780u}% \or
  }
  {\def\@biblabel##1{##1.}}
  {\def\@biblabel##1{[##1]}}}
\AtBeginDocument{%
  \@ifpackageloaded{babel}{\addto\captionsukrainian{%
    \def\bibname{{\cyr\CYRS\cyrp\cyri\cyrs\cyro\cyrk\ \cyro\cyrp\cyru\cyrb\cyrl\cyrii\cyrk\cyro\cyrv\cyra\cyrn\cyri\cyrh\ \cyrp\cyrr\cyra\cyrc\cyrsftsn\ \cyrz\cyra~\cyrt\cyre\cyrm\cyro\cyryu~\cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi}}}}{}}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\bibname{Bibliography}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\chaptername{Chapter}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\AtBeginDocument{%
\@ifpackageloaded{babel}{\addto\captionsukrainian{%
  \def\tablename{{\cyr\CYRT\cyra\cyrb\cyrl\cyri\cyrc\cyrya}}}}{}
}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\AtBeginDocument{\usepackage{casus}}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\newcommand{\slantedthmbody}{\def\sl@OR@it{%
  \expandafter\let\expandafter\@tempa\csname\f@shape shape\endcsname
  \ifx\@tempa\itshape\slshape\fi\let\itshape\slshape}}
\newcommand{\italicthmbody}{\def\sl@OR@it{%
  \expandafter\let\expandafter\@tempa\csname\f@shape shape\endcsname
  \ifx\@tempa\slshape\itshape\fi\let\slshape\itshape}}
\let\sl@OR@it\relax
\newcommand{\slantedall}{\let\itshape\slshape}
\def\@begintheorem#1#2{%
  \topsep\smallskipamount
  \trivlist
  \itemindent\parindent
  \item[\hskip \labelsep{\bfseries #1\ #2.}]\itshape\sl@OR@it}
\def\@opargbegintheorem#1#2#3{%
  \topsep\smallskipamount
  \trivlist
  \itemindent\parindent
  \item[\hskip \labelsep{\bfseries #1\ #2\ (#3).}]\itshape\sl@OR@it}
\AtBeginDocument{%
\@ifpackageloaded{amsthm}{%
  \def\@thm#1#2#3{%
    \ifhmode\unskip\unskip\par\fi
    \normalfont
    \topsep\smallskipamount
    \trivlist
    \let\thmheadnl\relax
    \let\thm@swap\@gobble
    \let\thm@indent\indent
    \thm@headpunct{.}% add period after heading
    \thm@headsep 5\p@ plus\p@ minus\p@\relax
    \thm@space@setup
    #1% style overrides
    \@topsep \thm@preskip               % used by thm head
    \@topsepadd \thm@postskip           % used by \@endparenv
    \def\@tempa{#2}\ifx\@empty\@tempa
      \def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
    \else
      \refstepcounter{#2}%
      \def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
    \fi
    \@tempa
  }%
  \def\swappedhead#1#2#3{%
    \thmnumber{#2}%
    \thmname{\@ifnotempty{#2}{.\enskip}#1}%
    \thmnote{ {\the\thm@notefont(#3)}}}
  \def\@begintheorem#1#2[#3]{%
    \deferred@thm@head{\the\thm@headfont \thm@indent
      \@ifempty{#1}{\let\thmname\@gobble}{\let\thmname\@iden}%
      \@ifempty{#2}{\let\thmnumber\@gobble}{\let\thmnumber\@iden}%
      \@ifempty{#3}{\let\thmnote\@gobble}{\let\thmnote\@iden}%
      \thm@swap\swappedhead\thmhead{#1}{#2}{#3}%
      \the\thm@headpunct
      \thmheadnl % possibly a newline.
      \hskip\thm@headsep
    }%
    \sl@OR@it
    \ignorespaces}%
  \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep2\p@\@plus\p@\relax%\topsep6\p@\@plus6\p@\relax
    \trivlist
    \itemindent\parindent
    \item[\hskip\labelsep
          \itshape
      #1\@addpunct{.}]\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }%
}{% гілку amsthm завершено, гілка не-amsthm порожня
}}
\AtBeginDocument{%
  \@ifpackageloaded{babel}{}{%
    \ClassError{\@classname}{Package `babel' is not loaded properly}%
      {You cannot use all features of \@classname\space class without multilingual support.\MessageBreak
       Load package `babel' with option `ukrainian' in the preamble of your document.}
  }}
\AtBeginDocument{%
  % \declare@shorthand{ukrainian}{",}{\nobreak\hskip.2em\ignorespaces}%
  \@ifpackageloaded{amssymb}{%
    \let\leq\leqslant
    \let\geq\geqslant
    \let\le\leqslant
    \let\ge\geqslant
    \let\emptyset\varnothing
  }{}%
  \def\Re{\mathop{\operator@font Re}\nolimits}%
  \def\Im{\mathop{\operator@font Im}\nolimits}%
  \def\ud{\mathrm d}%
}
\endinput
%%
%% End of file `vakaref.cls'.
