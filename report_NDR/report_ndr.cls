%% Identification
%% The class identifies itself and the LaTeX version needed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report_ndr}[2021/01/18]

\def\@@ptsize{14pt}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass[a4paper,
\@@ptsize,
]{extreport}

\RequirePackage{cmap}

% various font packages
\RequirePackage{tempora,newtxmath,amsmath,amssymb,amsfonts}

\RequirePackage{titlesec}
\titleformat{\chapter}[block]
  {\filcenter}
  {\thechapter}
  {1em}
  {\MakeUppercase}{}

\titlespacing*{\chapter}{0pt}{30pt}{*4}

\titleformat{\section}
  {}
  {\thesection}
  {1ex}{}

\titlespacing*{\section}{\parindent}{*4}{*4}


\titleformat{\subsubsection}[runin]
  {}
  {\thesubsubsection}
  {1ex}{}[.]

\titlespacing*{\subsubsection}{\parindent}{*4}{1ex}

\RequirePackage{mdwlist}

\RequirePackage[T2A, T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,russian,ukrainian]{babel}

\RequirePackage[left=2.5cm, right=1.5cm, vmargin=2.5cm]{geometry}

\RequirePackage{indentfirst}
\setlength\parindent{5ex}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{plain}{
  \fancyhf{}
  \rhead{\thepage}}

\newcommand\chap[1]{%
  \chapter*{#1}%
  \addcontentsline{toc}{chapter}{#1}}

\addto{\captionsukrainian}{\renewcommand*{\contentsname}{Зміст}}
\addto{\captionsrussian}{\renewcommand*{\contentsname}{Содержание}}

\RequirePackage{titletoc}

\dottedcontents{chapter}[1.6em]{}{1.6em}{1pc}

\RequirePackage[hidelinks]{hyperref}

\RequirePackage{icomma}

\RequirePackage[tableposition=top,singlelinecheck=false]{caption}
\RequirePackage{subcaption}

\DeclareCaptionLabelFormat{gostfigure}{Рисунок #2}
\DeclareCaptionLabelFormat{gosttable}{Таблиця #2}
\DeclareCaptionLabelSeparator{gost}{~---~}
\captionsetup{labelsep=gost}
\captionsetup*[figure]{labelformat=gostfigure}
\captionsetup*[table]{labelformat=gosttable}

\renewcommand{\thesubfigure}{\asbuk{subfigure}}

\renewcommand{\arraystretch}{1.3}

\RequirePackage{graphicx}

\RequirePackage{multirow}

\RequirePackage{caption}

% \renewcommand\floatpagefraction{0.01}

% \makeatletter
% \renewcommand*\fps@figure{p}
% \@fpsep\textheight
% \makeatother

% марковані списки
\renewcommand{\labelitemi}{</s>
\renewcommand{\labelitemii}<s>}
% нумеровані списки
\renewcommand{\labelenumi}{\asbuk{enumi})}
\renewcommand{\labelenumii}{\arabic{enumii})}

\RequirePackage{enumitem}
\makeatletter
    \AddEnumerateCounter{\asbuk}{\@asbuk}{ю)}
\makeatother
\setlist{nosep, leftmargin=\parindent}

% убираем дополнительные отступы
% и настраиваем пункты для всего списка
\setlist{nosep,wide}
% для пунктов 2-го уровня
% отступ метки от края равен двум абзацным отступам
\setlist[2]{labelindent=2\parindent}

\renewcommand{\labelitemi}{-}
\renewcommand{\labelitemii}{--}

\renewcommand*{\thefootnote}{\arabic{footnote})}

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 40mm height .4pt
  \kern 2.6pt
}

% \RequirePackage{minted}

\RequirePackage[title,titletoc]{appendix}

\newcommand{\empline}{\mbox{}\newline} % порожня стрічка

\newcommand{\append}[1]{
    \clearpage
    \stepcounter{chapter}
    \begin{center}
        \chaptertitlename~\Asbuk{chapter}
    \end{center}
    \begin{center}{#1}\end{center}
    \empline
    \addcontentsline{toc}{chapter}{\Asbuk{chapter}\hspace{0.6em}~#1}}

\frenchspacing
