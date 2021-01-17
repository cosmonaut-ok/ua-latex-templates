%% Identification
%% The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vant_article}[2019/05/05 Class, which accepts requirements of KNU REX ICAP conference (https://indico.knu.ua/category/5/)]

%%Preliminary definitions, needed by the options
\newcommand{\headlinecolor}{\normalcolor}
% \LoadClass{article}

\def\@@ptsize{10pt}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass[a4paper,
\@@ptsize,
]{extarticle}

% %%   packages
\RequirePackage{tempora}  % Times for numbers in math mode
\RequirePackage{newtxmath}

\RequirePackage{titlesec}
\titlelabel{\thetitle.\quad}

\RequirePackage{mdwlist}

\RequirePackage[left=2.5cm, right=2cm, top=2cm, bottom=2cm]{geometry}
\RequirePackage[affil-it]{authblk}

\renewcommand\Authfont{\bfseries \itshape \large}
\renewcommand\Affilfont{\bfseries \itshape \large}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T2A, T1]{fontenc}
\RequirePackage{graphicx}

\RequirePackage{float}

% \RequirePackage{wrapfig}
\RequirePackage{amssymb}
\RequirePackage[english,russian,ukrainian]{babel}

\pagenumbering{gobble} % remove page numbering. Variants: r(R)oman, a(A)rabic, a(A)lph


\titleformat*{\section}{\center \bfseries \large \MakeUppercase }
\titleformat*{\subsection}{\center \bfseries \normalsize \MakeUppercase }
\titleformat*{\subsubsection}{\center \bfseries \normalsize \MakeUppercase }

\titlespacing{\section}{0pt}{*0}{*0}
\titlespacing{\subsection}{0pt}{*0}{*0}
\titlespacing{\subsubsection}{0pt}{*0}{*0}

%% %% % \usepackage{cite}

\usepackage{multicol}
\setlength{\columnwidth}{8cm}
\setlength{\columnsep}{0.5cm}

\newcommand*{\email}[1]{
  \normalsize email: {#1}\par
}

%% \newcommand*{\pacs}[1]{
%%   \normalsize PACS Numbers: {#1}\par
%% }
\newcommand*{\pacs}{
  \normalsize PACS: {29.17.+w;41.75.Lx;}\par %% hardcoding PACS numbers yo ho ho
}

\RequirePackage[square,sort&compress,comma,numbers]{natbib}

\bibliographystyle{vant_bib} % git@gitlab.com:my-funny-plasma/bibliography.git required
% make bibliography compact
\setlength{\bibsep}{0pt plus 0.3ex}

\RequirePackage[format=plain,
labelfont=it,
textfont=it,
figurename=Fig.]{caption}

\makeatletter
\renewcommand{\maketitle}{
\begin{center}
{\Large\bfseries\MakeUppercase\@title\par}
\medskip
{\@author\par}
\end{center}
}
\makeatother

\setlength{\parindent}{0.5cm}
\setlength{\parskip}{0cm}

%% set abstract title
% \renewcommand{\abstractname}{Very good abstract}

\RequirePackage{indentfirst}

\renewenvironment{abstract}
{\list{}{
    \setlength{\leftmargin}{0px}
    \setlength{\rightmargin}{\leftmargin}
    \setlength{\itemindent}{0.5cm}
  }%
  \item\relax}
{\endlist}

%% reset footnote numeration on each page (begin from 1)
\RequirePackage{perpage}
\MakePerPage{footnote} %the perpage package command

\usepackage[font={it}]{caption}

\newenvironment{Figure}
{\par\medskip\noindent\minipage{\linewidth}}
{\endminipage\par\medskip}

\renewcommand{\bibsection}{\section*{References}}

\newcommand{\taaotherlang}[3]{ %% add title, author names and abstract on other languages (ukrainian and russian required by VANT)
  \begin{center}
    \section*{#1}
    \large{\textbf{\textit{#2}}}
  \end{center}
  \begin{abstract}
    {#3}
  \end{abstract}
}
