%%% mon2017dev.cls --- Оформлення дисертації згідно з вимогами МОН
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mon2017dev}
  [2019/11/16 v0.05 vakthesis support document class (OMB)]
% Означення опцій
\RequirePackage{xkeyval}
% Тип дисертації
\define@choicekey{mon2017dev.cls}{type}[\val\nr]{c,d,phd,artd,scd}{%
  \ifcase\nr\relax
    \AtBeginDocument{%
      \addto\captionsenglish{%
        \def\degreename{candidate of}%
        \def\degreephdname{doctor of philosophy}%
      }%
      \addto\captionsukrainian{%
        \def\degreename{\cyrk\cyra\cyrn\cyrd\cyri\cyrd\cyra\cyrt\cyra}%
        \def\degreephdname{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrf\cyrii\cyrl\cyro\cyrs\cyro\cyrf\cyrii\cyryi}%
      }%
    }%
  \or
    \AtBeginDocument{%
      \addto\captionsenglish{\def\degreename{doctor of}}%
      \addto\captionsukrainian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra}}%
    }%
  \or
    \AtBeginDocument{%
      \addto\captionsenglish{\def\degreename{doctor of philosophy}}%
      \addto\captionsukrainian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrf\cyrii\cyrl\cyro\cyrs\cyro\cyrf\cyrii\cyryi}}%
    }%
  \or
    \AtBeginDocument{%
      \addto\captionsenglish{\def\degreename{doctor of arts}}%
      \addto\captionsukrainian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrm\cyri\cyrs\cyrt\cyre\cyrc\cyrt\cyrv\cyra}}%
    }%
  \or
    \AtBeginDocument{%
      \addto\captionsenglish{\def\degreename{doctor of science}}%
      \addto\captionsukrainian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrn\cyra\cyru\cyrk}}%
    }%
  \fi
  \ifnum\nr<2\relax
    \AtEndOfClass{%
      \let\speciality\specialitysci
    }%
    \def\set@degree{\csname set@degree@\val\endcsname}%
    \def\set@speciality{\set@speciality@cd}%
    \def\set@abstract@speciality{\set@abstract@speciality@cd}%
    \PassOptionsToClass{\val}{vakthesis}%
  \else
    \AtEndOfClass{%
      \let\speciality\specialityedu
    }%
    \def\set@degree{\set@degree@phdartdscd}%
    \def\set@speciality{\set@speciality@phdartdscd}%
    \def\set@abstract@speciality{\set@abstract@speciality@phdartdscd}%
  \fi
  \ifnum\nr=4\relax
    \AtBeginDocument{%
      \def\onesupervisorname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyri\cyrishrt\
        \cyrk\cyro\cyrn\cyrs\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrn\cyrt}%
      \def\manysupervisorsname{\CYRN\cyra\cyru\cyrk\cyro\cyrv\cyrii\
        \cyrk\cyro\cyrn\cyrs\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrn\cyrt\cyri}%
    }%
  \fi
}
% Порядок розміщення на титульному аркуші
% назви установи і назви органу, до сфери управління якого належить установа
\define@choicekey{mon2017dev.cls}{instnameorder}{desc,asc,ascd}{%
  \def\set@institutions{\csname set@institutions@#1\endcsname}%
}
% Підключення модуля для підтримки специфічних вимог, рекомендацій
% окремого навчального закладу або наукової установи
% чи посібника, порадника з оформлення дисертації
\DeclareOptionX<mon2017dev.cls>{guide}{%
  \IfFileExists{#1.clo}%
    {\AtEndOfClass{\input{#1.clo}}}%
    {\ClassError{\@classname}{You cannot use option `guide=#1'}%
       {File `#1.clo' not found.}}}
% Решту опцій перенаправляємо до vakthesis
\DeclareOptionX*{%
  \PassOptionsToClass{\CurrentOption}{vakthesis}%
}
\ExecuteOptionsX{type=c,instnameorder=desc}
\ProcessOptionsX
\LoadClass{vakthesis}[2009/04/01]
\RequirePackage{environ}
% Пакунок suffix потрібен для означення команд з модифікаторами (uk), (en) тощо.
\RequirePackage{suffix}
% Щоб розкривати uk, en у повну назву мови.
\def\uklanguage{ukrainian}
\def\enlanguage{english}
% TODO: Якби користувач використовував, скажімо, ще й французьку мову,
% то мав би самостійно в тілі документа означити команду \frlanguage,
% щоб команди з модифікаторами працювали:
%   \def\frlanguage{french}
% Треба придумати, як за потреби робити такі означення <<автоматично>>
% або якось по-іншому обійти цю проблему.
% Типове значення модифікатора, щоб працювали стандартні команди без модифікаторів
% TODO: Потрібно перевірити, чи це насправді працює,
% коли перепишу всі команди на модифікатори і заберу оточення uk, en.
\def\@modifier{@\languagename}
% Пакунок datatool використовується для роботи з CSV-файлами.
% Він викликає пакунок datatool-base, який чомусь викликає amsmath.
% Якщо в документі викликати amsmath (з іншими опціями), то маємо option clash.
% Тому спробую викликати datatool пізніше.
\AtBeginDocument{%
  \RequirePackage[separator=;]{datatool}%
  % \DTLnewdbonloadfalse
}
% Пакунок xstring потрібен для роботи з рядками.
\usepackage{xstring}
% Для відмінювання назв установ.
% У ньому використовується кирилиця,
% тому його треба викликати після початку документа.
% \RequirePackage{casus}
\AtBeginDocument{\usepackage{casus}}
% (Старий варіант) Щоб забезпечити різні назви дисертації для різних мов,
% використовується механізм \captions<languagename> (з babel).
% Але якщо в документі немає зміни мови засобами babel,
% то команда \@title буде неозначена.
% Тому означуємо її глобально (бо \title буде всередині мовного оточення),
% а також додаємо до \captionsenglish чи \captionsukrainian.
% (Новий варіант) Тепер команди, які задаються двома мовами, переписані так,
% що команди мають модифікатори типу (uk), (en) для відповідних мов,
% і команди чи оточення для зміни мов засобами babel не потрібні,
% тобто механізм \captions<languagename> (з babel) не використовується.
% Цей підхід ефективніший за попередній,
% але виписані нижче TODO залишаються актуальні.
% TODO: 1. Це поганий код.
% У командах майже ті самі дії повторюються,
% тому треба було б зробити спеціальну команду
% і викликати її з конкретними параметрами.
% Але деякі команди (\author, пов'язані зі speciality, ...) потребують особливої уваги,
% тому під загальну схему не підпадають.
% 2. Треба глянути, чи є стандартні засоби babel для цього,
% або глянути спеціальні пакунки типу translations, translator тощо.
% TODO: Мабуть, такий механізм підтримки двох мов не працюватиме з polyglossia
% (аналог babel для користувачів XeLaTeX та LuaLaTeX),
% бо він ґрунтується на засобах babel.
% Але я не користуюся XeLaTeX чи LuaLaTeX,
% тому найближчим часом у це не заглиблюватимуся.
\renewcommand{\title}[1]{%
  \expandafter\def\csname @title\@modifier\endcsname{#1}%
}
\WithSuffix\def\title(#1){%
  \def\@modifier{@\csname#1language\endcsname}%
  \title
}
\renewcommand{\author}[1]{%
  \expandafter\def\csname @author\@modifier\endcsname{#1}%
  \expandafter\def\csname @shortauthor\@modifier\endcsname{\@shortifyname#1\@nil}%
  \expandafter\def\csname n@shortauthor\@modifier\endcsname{\n@shortifyname#1\@nil}%
  \expandafter\def\csname e@shortauthor\@modifier\endcsname{\e@shortifyname#1\@nil}%
  \expandafter\def\csname shortauthor@\@modifier\endcsname{\shortifyname@#1\@nil}%
}
\WithSuffix\def\author(#1){%
  \def\@modifier{@\csname#1language\endcsname}%
  \author
}
% Скоротити ім'я і по батькові, поставити перед прізвищем
\def\@shortifyname#1 #2 #3\@nil{%
  \@shortify@name#2\@nil
  \@shortify@name#3\@nil
  #1%
}
% Ім'я повністю, скоротити тільки по батькові, поставити перед прізвищем
\def\n@shortifyname#1 #2 #3\@nil{%
  #2
  \@shortify@name#3\@nil
  #1%
}
% Скоротити ім'я, пропустити по батькові, поставити перед прізвищем
\def\e@shortifyname#1 #2 #3\@nil{%
  \@shortify@name#2\@nil
  #1%
}
\def\@shortify@name#1#2\@nil{#1.~}
% Скоротити ім'я і по батькові, поставити після прізвища
\def\shortifyname@#1 #2 #3\@nil{%
  #1%
  \shortify@name@#2\@nil
  \shortify@name@#3\@nil
}
\def\shortify@name@#1#2\@nil{~#1.}
% Науковий керівник
% Для коректної роботи команди \supervisor тепер не потрібен лічильник @supervisors@count.
% Якщо команду типу \@supervisors@ukrainian не означено, то \supervisor викликано вперше.
% Для іншої мови -- відповідна команда.
\renewcommand{\supervisor}[3]{%
  \ifcsname @supervisors\@modifier\endcsname
    \expandafter\g@addto@macro\csname @supervisors\@modifier\endcsname{\\{#1}{#2}}%
    \expandafter\def\csname @supervisors@caption\@modifier\endcsname{%
      \manysupervisorsname:%
    }%
  \else
    \expandafter\def\csname @supervisors\@modifier\endcsname{\\{#1}{#2}}%
    \expandafter\def\csname @supervisors@caption\@modifier\endcsname{%
      \onesupervisorname:%
    }%
  \fi
}
\WithSuffix\def\supervisor(#1){%
  \def\@modifier{@\csname#1language\endcsname}%
  \supervisor
}
% Шифр і назва спеціальності
% Типове значення для файла спеціальності, якщо користувач нічого не задав.
\def\specialityfilename{specsci20150406n394.uk.csv}
% За Переліком наукових спеціальностей
\define@key{specialitysci}{specialityname}{%
  \expandafter\def\csname @specialitysci@name\@modifier\endcsname{#1}%
}
\define@key{specialitysci}{degreefield}{%
  \expandafter\def\csname @specialitysci@degreefield\@modifier\endcsname{#1}%
}
\define@key{specialitysci}{specialityfile}{%
  \def\specialityfilename{#1}%
}
\newcommand{\specialitysci}[2][]{%
  \expandafter\def\csname @specialitysci@code\@modifier\endcsname{#2}%
  \setkeys{specialitysci}{#1}%
  \ifthenelse{%
    \expandafter\isundefined
      \expandafter{\csname @specialitysci@name\@modifier\endcsname}
    \or
    \expandafter\isundefined
      \expandafter{\csname @specialitysci@degreefield\@modifier\endcsname}%
  }
  {%
    \DTLloaddb{specdb}{\specialityfilename}%
    \DTLforeach*
    {specdb}
    {\Code=Code,\Name=Name,\Degree=Degree}
    {%
      \DTLifstringeq{\Code}{\csname @specialitysci@code\@modifier\endcsname}
      {%
        \ifcsname @specialitysci@name\@modifier\endcsname
        \else
          \expandafter\edef\csname @specialitysci@name\@modifier\endcsname{\Name}%
        \fi
        \ifcsname @specialitysci@degreefield\@modifier\endcsname
        \else
          \expandafter\edef\csname @specialitysci@degreefield\@modifier\endcsname{\Degree}%
        \fi
        \dtlbreak
      }
      {}%
    }%
    \DTLifdbexists{specdb}{\DTLcleardb{specdb}\DTLdeletedb{specdb}}{}%
  }
  {}%
}
\WithSuffix\def\specialitysci(#1){%
  \def\@modifier{@\csname#1language\endcsname}%
  \def\specialityfilename{specsci20150406n394.#1.csv}%
  \specialitysci
}
% За Переліком галузей знань і спеціальностей,
% за якими здійснюється підготовка здобувачів вищої освіти
\define@key{specialityedu}{specialityname}{%
  \expandafter\def\csname @specialityedu@name\@modifier\endcsname{#1}%
}
\define@key{specialityedu}{fieldcode}{%
  \expandafter\def\csname @specialityedu@fieldcode\@modifier\endcsname{#1}%
}
\define@key{specialityedu}{fieldname}{%
  \expandafter\def\csname @specialityedu@fieldname\@modifier\endcsname{#1}%
}
\define@key{specialityedu}{specialityfile}{%
  \def\specialityfilename{#1}%
}
\newcommand{\specialityedu}[2][]{%
  \expandafter\def\csname @specialityedu@code\@modifier\endcsname{#2}%
  \setkeys{specialityedu}{#1}%
  \ifthenelse{%
    \expandafter\isundefined
      \expandafter{\csname @specialityedu@name\@modifier\endcsname}
    \or
    \expandafter\isundefined
      \expandafter{\csname @specialityedu@fieldname\@modifier\endcsname}%
  }
  {\DTLloaddb{specdb}{\specialityfilename}}
  {}%
  \ifcsname @specialityedu@name\@modifier\endcsname
  \else
    \DTLforeach*
    {specdb}
    {\Code=Code,\Name=Name}
    {%
      \DTLifstringeq{\Code}{\csname @specialityedu@code\@modifier\endcsname}
      {%
        \expandafter\edef\csname @specialityedu@name\@modifier\endcsname{\Name}%
        \dtlbreak
      }
      {}%
    }%
  \fi
  \ifcsname @specialityedu@fieldcode\@modifier\endcsname
  \else
    % \expandafter\def\csname @specialityedu@fieldcode\@modifier\endcsname
    %   {\substr{#2}{1}{2}}% Так не працює порівняння в \DTLforeach*
    \expandafter\def\csname @specialityedu@fieldcode\@modifier\endcsname
      {\@gobble@third@digit#2\@nil}% Тому роблю простіше: відкидаю третю цифру
  \fi
  \ifcsname @specialityedu@fieldname\@modifier\endcsname
  \else
    \DTLforeach*
    {specdb}
    {\Code=Code,\Name=Name}
    {%
      \DTLifstringeq{\Code}{\csname @specialityedu@fieldcode\@modifier\endcsname}
      {%
        \expandafter\edef\csname @specialityedu@fieldname\@modifier\endcsname{\Name}%
        \dtlbreak
      }
      {}%
    }%
  \fi
  \DTLifdbexists{specdb}{\DTLcleardb{specdb}\DTLdeletedb{specdb}}{}%
}
\def\@gobble@third@digit#1#2#3\@nil{#1#2}
\WithSuffix\def\specialityedu(#1){%
  \def\@modifier{@\csname#1language\endcsname}%
  \def\specialityfilename{specedu20170201n53.#1.csv}%
  \specialityedu
}
% Установа, де виконана робота
\define@key{institution}{altname}{%
  \expandafter\def\csname @institution@altname\@modifier\endcsname{#1}%
}
\renewcommand{\institution}[3][]{%
  \@split@institution#2,,\@nil
  \setkeys{institution}{#1}%
  \expandafter\def\csname @towni\@modifier\endcsname{#3}%
}
\def\@split@institution#1,#2,#3\@nil{%
  \expandafter\def\csname @institution\@modifier\endcsname{#1}%
  \ifx\relax#2\relax
  \else
    \expandafter\def\csname @institution@office\@modifier\endcsname{\ignorespaces#2}%
  \fi
}
\WithSuffix\def\institution(#1){%
  \def\@modifier{@\csname#1language\endcsname}%
  \institution
}
% Рада, де буде захист
%% Синтаксис команди
%% \council[
%%   institution={установа, підпорядкування},
%%   altname=альтернативна назва установи,
%%   address={адреса установи},
%%   town=місто
%% ]{шифр ради}
\define@key{council}{institution}{%
  \@split@council@institution#1,,\@nil
}
\def\@split@council@institution#1,#2,#3\@nil{%
  \expandafter\def\csname @council@institution\@modifier\endcsname{#1}%
  \ifx\relax#2\relax
  \else
    \expandafter\def\csname @council@institution@office\@modifier\endcsname{\ignorespaces#2}%
  \fi
}
\define@key{council}{altname}{%
  \expandafter\def\csname @council@institution@altname\@modifier\endcsname{#1}%
}
%+TODO: Для автореферату ще має бути address
% TODO: Треба ще відновити вирізання міста з адреси, яке раніше було в авторефераті.
\define@key{council}{address}{%
  % У дисертації не використовується (тільки в авторефераті)
}
\define@key{council}{town}{%
  \expandafter\def\csname @council@town\@modifier\endcsname{#1}%
}
\newcommand{\council}[2][]{%
  \expandafter\def\csname @council@code\@modifier\endcsname{#2}%
  \setkeys{council}{#1}%
}
\WithSuffix\def\council(#1){%
  \def\@modifier{@\csname#1language\endcsname}%
  \council
}
% Для оформлення інформації про наукового керівника на титульному аркуші.
% Тепер схоже на те, що в авторефераті.
% (додано з vakaref.cls зі змінами)
\newenvironment{listofpersons}[1]
  {\list{#1\hfil}{\topsep0pt\parsep0pt\itemsep.5\parskip
   \settowidth\@tempdima{#1}%
   \setlength\labelwidth{\@tempdima}%
   \setlength\leftmargin{\labelwidth}%
   \addtolength\leftmargin{\labelsep}%
   \def\makelabel##1{##1}%
   \def\makephantomlabel##1{\phantom{##1}}}%
   \rightskip\@flushglue% ! нерівний правий край, але при дуже вузькій колонці погано
                        % ? можуть виникати Underfull \hbox
  }
  {\endlist}
% Титульний аркуш
\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \@maketitle
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  % \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
% Команди для правильного розміщення на титульному аркуші назв установ
% залежно від вибраної опції
\def\set@institutions@desc{%
  {\scshape
   \ifcsname @institution@office@\languagename\endcsname
     \csname @institution@office@\languagename\endcsname\par
   \fi
   \csname @institution@\languagename\endcsname\par}
  \smallskip
  {\scshape
   \ifcsname @council@institution@office@\languagename\endcsname
     \csname @council@institution@office@\languagename\endcsname\par
   \fi
   \csname @council@institution@\languagename\endcsname\par}
}
\def\set@institutions@asc{%
  {\scshape
   \csname @institution@\languagename\endcsname\par
   \ifcsname @institution@office@\languagename\endcsname
     \csname @institution@office@\languagename\endcsname\par
   \fi}
  \smallskip
  {\scshape
   \csname @council@institution@\languagename\endcsname\par
   \ifcsname @council@institution@office@\languagename\endcsname
     \csname @council@institution@office@\languagename\endcsname\par
   \fi}
}
% REVIEW: Тут жорстко прописано
% \@institution@office@ukrainian і \@council@institutiont@office@ukrainian,
% бо інакше не виходить.
% Насправді, для англійської мови варіант з відмінюванням і не потрібен.
% Але треба так зробити, щоб код з відмінюванням не міг виконуватися,
% коли головна мова документа -- англійська.
\def\set@institutions@ascd{%
  {\scshape
   \csname @institution@\languagename\endcsname\par
   \ifcsname @institution@office@\languagename\endcsname
     \iflanguage{ukrainian}%
       {\transformsentence{G}{\@institution@office@ukrainian} }%
       {\csname @institution@office@\languagename\endcsname}%
     \par
   \fi}
  \smallskip
  {\scshape
   \csname @council@institution@\languagename\endcsname\par
   \ifcsname @council@institution@office@\languagename\endcsname
     \iflanguage{ukrainian}%
       {\transformsentence{G}{\@council@institution@office@ukrainian} }%
       {\csname @council@institution@office@\languagename\endcsname}%
     \par
   \fi}
}
% Команди для правильного розміщення інформації про спеціальність
% залежно від типу дисертації
% (на титульному аркуші й в анотації)
% Артем Чуйков запропонував 2019/10/01 зробити «змішаний» ступінь,
% щоб на на титульному аркуші й в анотації
% було написано шифри й назви спеціальностей за обома переліками,
% а для типу дисертації c ще й ступінь у вигляді
% «кандидата ... наук (доктора філософії)»
% За його словами в Інституті математики вважають правильними обидва варіанти оформлення:
% стандартний і змішаний.
% У команди для спеціальності і ступеня внесені такі зміни,
% що тепер можуть одночасно використовуватися відомості,
% задані в обох командах: \specialitysci і \specialityedu.
\def\set@speciality@cd{%
  \csname @specialitysci@code@\languagename\endcsname\
  \cdash---
  \csname @specialitysci@name@\languagename\endcsname
  \ifcsname @specialityedu@code@\languagename\endcsname
    \par
    \csname @specialityedu@code@\languagename\endcsname\
    \cdash---
    \csname @specialityedu@name@\languagename\endcsname
  \fi
}
\def\set@abstract@speciality@cd{%
  \csname @specialitysci@code@\languagename\endcsname\
  \cdash---
  \csname @specialitysci@name@\languagename\endcsname
  \ifcsname @specialityedu@code@\languagename\endcsname
    \ (\csname @specialityedu@code@\languagename\endcsname\
    \cdash---
    \csname @specialityedu@name@\languagename\endcsname)%
  \fi
}
\def\set@speciality@phdartdscd{%
  \csname @specialityedu@code@\languagename\endcsname\
  \cdash---
  \csname @specialityedu@name@\languagename\endcsname\par
  \csname @specialityedu@fieldname@\languagename\endcsname
}
\def\set@abstract@speciality@phdartdscd{%
  \csname @specialityedu@code@\languagename\endcsname\
  \cdash---
  \csname @specialityedu@name@\languagename\endcsname
}
% Для mon2017dev.karazin.clo треба degreefield і в називному, і в родовому відмінку.
% Тому змінив у CSV-файлі: тепер там зберігається просто «педагогічні»,
% а ця команда змінює на «педагогічних наук».
% Інформація про те, коли і як писати, звідси:
% https://uk.wikipedia.org/wiki/Кандидат_наук#Наукові_галузі
% https://uk.wikipedia.org/wiki/Доктор_наук#Номенклатура_наукового_ступеня_«доктор_наук»
\def\degreefield@tf@ukrainian#1{%
  \IfEndWith{#1}{\cyrii}{%
    \StrGobbleRight{#1}{1}\cyri\cyrh\ \cyrn\cyra\cyru\cyrk
    % \case[adjective]{G}{#1} наук% не працює тут
  }{%
    \IfStrEqCase{#1}{%
      {\cyra\cyrr\cyrh\cyrii\cyrt\cyre\cyrk\cyrt\cyru\cyrr\cyra}% архітектура
      {\StrGobbleRight{#1}{1}\cyri}% \case{G}{#1} не працює тут
      {\cyrk\cyru\cyrl\cyrsftsn\cyrt\cyru\cyrr\cyro\cyrl\cyro\cyrg\cyrii\cyrya}% культурологія
      {\StrGobbleRight{#1}{1}\cyryi}%
      {\cyrm\cyri\cyrs\cyrt\cyre\cyrc\cyrt\cyrv\cyro\cyrz\cyrn\cyra\cyrv\cyrs\cyrt\cyrv\cyro}% мистецтвознавство
      {\StrGobbleRight{#1}{1}\cyra}%
      {\cyrd\cyre\cyrr\cyrzh\cyra\cyrv\cyrn\cyre\space
        \cyru\cyrp\cyrr\cyra\cyrv\cyrl\cyrii\cyrn\cyrn\cyrya}% державне управління
      {\cyrn\cyra\cyru\cyrk\ \cyrz\
        \cyrd\cyre\cyrr\cyrzh\cyra\cyrv\cyrn\cyro\cyrg\cyro\
        \cyru\cyrp\cyrr\cyra\cyrv\cyrl\cyrii\cyrn\cyrn\cyrya}%
      {\cyrf\cyrii\cyrz\cyri\cyrch\cyrn\cyre\space
        \cyrv\cyri\cyrh\cyro\cyrv\cyra\cyrn\cyrn\cyrya\space
        \cyrii\space
        \cyrs\cyrp\cyro\cyrr\cyrt}% фізичне виховання і спорт
      {\cyrn\cyra\cyru\cyrk\ \cyrz\
        \cyrf\cyrii\cyrz\cyri\cyrch\cyrn\cyro\cyrg\cyro\
        \cyrv\cyri\cyrh\cyro\cyrv\cyra\cyrn\cyrn\cyrya\
        \cyrii\
        \cyrs\cyrp\cyro\cyrr\cyrt\cyru}%
      {\cyrs\cyro\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyrii\space
        \cyrk\cyro\cyrm\cyru\cyrn\cyrii\cyrk\cyra\cyrc\cyrii\cyryi}% соціальні комунікації
      {\cyrn\cyra\cyru\cyrk\ \cyrii\cyrz\
        \cyrs\cyro\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyri\cyrh\
        \cyrk\cyro\cyrm\cyru\cyrn\cyrii\cyrk\cyra\cyrc\cyrii\cyrishrt}%
    }%
    [#1]%
  }%
}
% TODO: Англійською теж можуть бути різні варіанти (типу мистецтвознавства).
% Але у мене нині немає повного переліку наукових спеціальностей англійською.
% Тому залишу це на потім (якщо виникне потреба).
\def\degreefield@tf@english#1{#1 sciences}
\def\set@degree@c{%
  \degreename\
  \csname degreefield@tf@\languagename\endcsname{\csname @specialitysci@degreefield@\languagename\endcsname}%
  \ifcsname @specialityedu@code@\languagename\endcsname
    \ (\degreephdname)%
  \fi
}
\def\set@degree@d{%
  \csname
  \degreename\ degreefield@tf@\languagename\endcsname{\csname @specialitysci@degreefield@\languagename\endcsname}%
}
\def\set@degree@phdartdscd{%
  \degreename
}
\def\@maketitle{%
  \set@institutions
  \vspace{\stretch{3}}%
  {\raggedleft
    \parbox[b]{165pt}{\raggedright\manuscriptname}%
    \par}%
  \vspace{\stretch{2}}%
  {\bfseries\expandafter\expandafter\expandafter\emphsurname\csname @author@\languagename\endcsname \par}%
  \vspace{\stretch{2}}%
  {\raggedleft
    \@ifundefined{@secret}{}{%
      \@secret\\
      \CYRP\cyrr\cyri\cyrm.~\No~\placeholder[5mm]\\}
    \CYRU\CYRD\CYRK\ \@udc \par}%
  \vspace{\stretch{1}}%
  {\bfseries\scshape\CYRD\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrya\par}
  {\large\bfseries\scshape \csname @title@\languagename\endcsname \par}%
  \vspace{\stretch{1}}%
  \set@speciality\par
  \vspace{\stretch{1}}%
  % Подається на здобуття наукового ступеня
  \CYRP\cyro\cyrd\cyra\cyrie\cyrt\cyrsftsn\cyrs\cyrya\
  \cyrn\cyra\ \cyrz\cyrd\cyro\cyrb\cyru\cyrt\cyrt\cyrya\
  \cyrn\cyra\cyru\cyrk\cyro\cyrv\cyro\cyrg\cyro\
  \cyrs\cyrt\cyru\cyrp\cyre\cyrn\cyrya\\
  \set@degree\par
  \end{center}
  \vspace{\stretch{2}}%
  {\small% Це не основний текст для титульного аркуша, тому зменшимо.
    % Дисертація містить результати власних досліджень.
    \CYRD\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrya\
    \cyrm\cyrii\cyrs\cyrt\cyri\cyrt\cyrsftsn\
    \cyrr\cyre\cyrz\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrt\cyri\
    \cyrv\cyrl\cyra\cyrs\cyrn\cyri\cyrh\
    \cyrd\cyro\cyrs\cyrl\cyrii\cyrd\cyrzh\cyre\cyrn\cyrsftsn.
    % Використання ідей, результатів і текстів інших авторів мають посилання на відповідне джерело 
    \CYRV\cyri\cyrk\cyro\cyrr\cyri\cyrs\cyrt\cyra\cyrn\cyrn\cyrya\
    \cyrii\cyrd\cyre\cyrishrt,
    \cyrr\cyre\cyrz\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrt\cyrii\cyrv\
    \cyrii~%
    \cyrt\cyre\cyrk\cyrs\cyrt\cyrii\cyrv\
    \cyrii\cyrn\cyrsh\cyri\cyrh\
    \cyra\cyrv\cyrt\cyro\cyrr\cyrii\cyrv\
    \cyrm\cyra\cyryu\cyrt\cyrsftsn\
    \cyrp\cyro\cyrs\cyri\cyrl\cyra\cyrn\cyrn\cyrya\
    \cyrn\cyra\
    \cyrv\cyrii\cyrd\cyrp\cyro\cyrv\cyrii\cyrd\cyrn\cyre\
    \cyrd\cyrzh\cyre\cyrr\cyre\cyrl\cyro.\par
    \medskip
    \raggedleft
    \placeholder[25mm]
    \csname @shortauthor@\languagename\endcsname\par}
  \vspace{\stretch{2}}%
  {%
   \let\\\@format@person
   \ifcsname @supervisors@\languagename\endcsname
     \begin{listofpersons}{\csname @supervisors@caption@\languagename\endcsname}
       \csname @supervisors@\languagename\endcsname\relax
     \end{listofpersons}
   \fi
  }%
  \vspace{\stretch{3}}%
  \begin{center}
  \csname @towni@\languagename\endcsname\ --- \@year}
\def\@format@person#1#2{\item
  \textbf{#1}, \linebreak[1]\@@format@person#2,,\@nil
  \let\makelabel\makephantomlabel
  \futurelet\next\@delimit@person}
% Abstract буде збиратися на місці, а не копіюватися і переноситися
\define@cmdkey{abstract}{language}{}
\define@cmdkey{abstract}{chapter}{}
\define@boolkey{abstract}{header}[true]{}
\renewenvironment{abstract}[1][]{%
  \KV@abstract@headertrue
  \setkeys{abstract}{#1}%
  \ifdefined\cmdKV@abstract@language
    \expandafter\selectlanguage\expandafter{\cmdKV@abstract@language}%
  \fi
  \ifdefined\cmdKV@abstract@chapter
    \def\@tempa{true}%
    \def\@tempb{false}%
    \ifx\cmdKV@abstract@chapter\@tempb
      \bigskip
    \else
      \ifx\cmdKV@abstract@chapter\@tempa
      \else
        \def\abstractname{\cmdKV@abstract@chapter}%
      \fi
      % \chapter*{\abstractname}%
      % Щоб заголовок Анотація не потрапляв у зміст.
      % REVIEW: Скопійовано з \tableofcontents.
      % Потрібна додаткова перевірка.
      \@tocheader{%
        \abstractname
        \@mkboth{\MakeUppercase\abstractname}{\MakeUppercase\abstractname}%
      }%
    \fi
  \else
    % \chapter*{\abstractname}%
    % Щоб заголовок Анотація не потрапляв у зміст.
    % REVIEW: Скопійовано з \tableofcontents.
    % Потрібна додаткова перевірка.
    \@tocheader{%
      \abstractname
      \@mkboth{\MakeUppercase\abstractname}{\MakeUppercase\abstractname}%
    }%
  \fi
  \ifKV@abstract@header
    \@abstract
  \fi
}{%
}
\def\@abstract{%
  \emph{\csname shortauthor@@\languagename\endcsname}
  \csname @title@\languagename\endcsname.
  \cdash---
  \manuscriptname.
  \par
  \set@thesisdescription.
  \cdash---
  \ifcsname @institution@altname@\languagename\endcsname
    \csname @institution@altname@\languagename\endcsname
  \else
    \ifcsname @institution@office@\languagename\endcsname
      \csname @institution@office@\languagename\endcsname,
    \fi
    \csname @institution@\languagename\endcsname
  \fi
  \ifcsname @council@town@\languagename\endcsname
    \ifthenelse{\equal{\csname @towni@\languagename\endcsname}{\csname @council@town@\languagename\endcsname}}%
      {}%
      {, \csname @towni@\languagename\endcsname}%
  \fi
  \ifcsname @council@institution@altname@\languagename\endcsname
    ; \csname @council@institution@altname@\languagename\endcsname
  \else
    \ifcsname @council@institution@\languagename\endcsname
      ;
      \ifcsname @council@institution@office@\languagename\endcsname
        \csname @council@institution@office@\languagename\endcsname,
      \fi
      \csname @council@institution@\languagename\endcsname
    \fi
  \fi
  ,
  \ifcsname @council@town@\languagename\endcsname
    \csname @council@town@\languagename\endcsname
  \else
    \csname @towni@\languagename\endcsname
  \fi,
  \@year.
  \par
  \smallskip
}
% Нова команда для списку ключових слів (тепер форматується на місці, а не переноситься)
\newcommand{\keywords}[1]{%
  \smallskip
  \emph{\keywordsname}:
  #1.
  \par
  % \bigskip
}
% Копіювання відомостей про апробацію зі вступу в додаток.
% TODO: Чи слово approval підходить тут?
% https://en.wiktionary.org/wiki/approval
% https://en.wiktionary.org/wiki/approbation
% https://e2u.org.ua/s?w=%D0%B0%D0%BF%D1%80%D0%BE%D0%B1%D0%B0%D1%86%D1%96%D1%8F&dicts=all&highlight=on&filter_lines=on
\NewEnviron{approval}[1][\approvalname]{%
  \paragraph{#1}%
  \global\let\sav@approval\BODY
  \BODY
}
\newcommand{\repeatapproval}{%
  \def\approvalname{%
    % Відомості про апробацію результатів дисертації
    {\cyr\CYRV\cyrii\cyrd\cyro\cyrm\cyro\cyrs\cyrt\cyrii\
      \cyrp\cyrr\cyro\
      \cyra\cyrp\cyrr\cyro\cyrb\cyra\cyrc\cyrii\cyryu\
      \cyrr\cyre\cyrz\cyru\cyrl\cyrsftsn\cyrt\cyra\cyrt\cyrii\cyrv\
      \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi}%
  }%
  \renewcommand{\participation}[1]{\unskip, ##1}%
  \section{\approvalname}%
  \sav@approval
}
\def\approvalname{%
  % Апробація матеріалів дисертації
  {\cyr\CYRA\cyrp\cyrr\cyro\cyrb\cyra\cyrc\cyrii\cyrya\
    \cyrm\cyra\cyrt\cyre\cyrr\cyrii\cyra\cyrl\cyrii\cyrv\
    \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi}%
}%
% Цією командою позначаємо форму участі в конференції.
% Тоді можна зробити так, щоб у вступі не писати, а в додатку -- писати.
\newcommand{\participation}[1]{\unskip}
% Список публікацій здобувача
% Це буде після анотації, із заголовком, який не попадає у зміст
\newenvironment{authorpublications}[1]
     {% \chapter*{\bibname}%
      % \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \@tocheader{%
        \bibname
        \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      }%
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
% Це буде в додатку, як підрозділ
\newenvironment{reauthorpublications}[1]
     {\section{\bibname}%
      % \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
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
% Спочатку пробував копіювати оточення.
% Виникла проблема, що копіювали тільки внутрішність, без \list, \endlist.
% Отже, треба про це потурбуватися у повторі.
% Але насправді немає потреби копіювати те, що всередині оточення.
% Можна просто підтягнути ще раз готовий .bbl-файл (цей варіант використовую).
% TODO: Що робити, якщо вміст .bbl-файла вставлено в .tex-файл?
%       Або просто автор робить список літератури вручну, без BibTeX?
%       Тоді цей підхід не працюватиме.
% TODO: Якщо в анотації два списки публікацій здобувача (укр. і англ.),
%       то який підтягувати в додатку?
\newcommand{\repeatauthorpublications}{%
  \def\bibname{% Список публікацій здобувача за темою дисертації
    {\cyr\CYRS\cyrp\cyri\cyrs\cyro\cyrk\
      \cyrp\cyru\cyrb\cyrl\cyrii\cyrk\cyra\cyrc\cyrii\cyrishrt\
      \cyrz\cyrd\cyro\cyrb\cyru\cyrv\cyra\cyrch\cyra\
      \cyrz\cyra\
      \cyrt\cyre\cyrm\cyro\cyryu\
      \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi}}%
  \let\thebibliography\reauthorpublications
  \let\endthebibliography\endreauthorpublications
  \let\@lbibitem\simple@lbibitem
  \let\@bibitem\simple@bibitem
  \@input@{\jobname1.bbl}%
}
% Для \bibitem, яка тільки позначка, але посилання на неї не буде.
% Щоб уникнути multiply-defined labels.
\def\simple@lbibitem[#1]#2{\item[\@biblabel{#1}\hfill]\ignorespaces}
\def\simple@bibitem#1{\item\ignorespaces}
% Тут внесено зміни для підтримки authorpublications.
\renewenvironment{bibset}[2][]
  {\stepcounter{currbibset}%
   \def\@temp{#1}%
   \ifx\@temp\@empty
     \def\@bibmark{\relax}%FIXME: \def\@bibmark{} не працює
   \else
     \def\@bibmark{\textsuperscript{#1}}%
   \fi
   \let\@sav@lbibitem\@lbibitem
   \def\@lbibitem[##1]##2{\@sav@lbibitem[##1\@bibmark]{##2}}%
   \@ifundefined{hyper@warn}
%% якщо не підключений пакет hyperref
     {\def\@bibitem##1{\item\if@filesw \immediate\write\@auxout
        {\string\bibcite{##1}{\the\value{\@listctr}\expandafter\string\@bibmark}}%
        \fi\ignorespaces}}
%% якщо підключений пакет hyperref
     {\def\@bibitem##1{%
      \@skiphyperreftrue\H@item\@skiphyperreffalse
      \hyper@anchorstart{cite.##1}\relax\hyper@anchorend
      \if@filesw {\let\protect\noexpand
      \immediate\write\@auxout{%
        \string\bibcite{##1}{\the\value{\@listctr}\expandafter\string\@bibmark}}}%
      \fi
      \ignorespaces}}%
   \def\bibname{#2}%
   \let\bibliography\@thisbibliography
   \let\bibliographystyle\@thisbibliographystyle
% Якщо перший, то це список публікацій здобувача після анотації.
   \ifnum\thecurrbibset=1
     \let\thebibliography\authorpublications
     \let\endthebibliography\endauthorpublications
     \let\@lbibitem\simple@lbibitem
     \let\@bibitem\simple@bibitem
   \fi}
  {\ifnum\thecurrbibset=\theneedbibset
     \ifnum\theneedbibset=1
       \immediate\write\@auxout{\string\setcounter{needbibset}{2}}%
     \else
       \immediate\write\@auxout{\string\setcounter{needbibset}{1}}%
     \fi
   \fi}
% Зарезервовані слова (англійською і українською)
% TODO: Перекласти англійською всі службові слова.
% Перекладено тільки ті слова, що використовуються в анотації.
% Тому можна використовувати, якщо головна мова документа -- ukrainian,
% і анотації українською і англійською.
% Але не рекомендовано використовувати для англомовних документів
% (коли english -- головна мова документа).
\AtBeginDocument{%
\addto\captionsenglish{%
  \def\manuscriptname{%
    % FIXME: Qualification чи Qualifying?
    Qualification scientific work in the form of manuscript%
  }%
  \def\set@thesisdescription{%
    Thesis for \set@degree\ degree
    in speciality \set@abstract@speciality
  }%
  \def\keywordsname{Key words}%
}
\addto\captionsukrainian{%
  \def\manuscriptname{%
    % Кваліфікаційна наукова праця на правах рукопису
    \CYRK\cyrv\cyra\cyrl\cyrii\cyrf\cyrii\cyrk\cyra\cyrc\cyrii\cyrishrt\cyrn\cyra\
    \cyrn\cyra\cyru\cyrk\cyro\cyrv\cyra\
    \cyrp\cyrr\cyra\cyrc\cyrya\
    \cyrn\cyra\
    \cyrp\cyrr\cyra\cyrv\cyra\cyrh\
    \cyrr\cyru\cyrk\cyro\cyrp\cyri\cyrs\cyru
  }%
  \def\set@thesisdescription{%
    % Дисертація на здобуття наукового ступеня
    % кандидата педагогічних наук (доктора філософії)
    \CYRD\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrya\
    \cyrn\cyra\
    \cyrz\cyrd\cyro\cyrb\cyru\cyrt\cyrt\cyrya\
    \cyrn\cyra\cyru\cyrk\cyro\cyrv\cyro\cyrg\cyro\
    \cyrs\cyrt\cyru\cyrp\cyre\cyrn\cyrya\
    \set@degree\
    \cyrz\cyra\
    \cyrs\cyrp\cyre\cyrc\cyrii\cyra\cyrl\cyrsftsn\cyrn\cyrii\cyrs\cyrt\cyryu\
    \set@abstract@speciality
  }%
  \def\keywordsname{\CYRK\cyrl\cyryu\cyrch\cyro\cyrv\cyrii\ \cyrs\cyrl\cyro\cyrv\cyra}%
}
}
%
% Латка для babel-ukrainian
%
% Ольга Свинчук (2018/05/17) і Вадим Коротєєв (2019/08/01) незалежно повідомили
% про проблему, яку спричиняє тире (точніше \cdash---) в англомовній анотації.
% За повідомленням Ольги використання команди \makeabstract
% (яка у версії 0.02 класу mon2017dev збирала анотацію)
% призводить до такого повідомлення про помилку:
%   command \cyrdash unavailable in encoding OT1.
% Команда \cyrdash "--- це внутрішня команда, яку викликає \cdash.
% Вадим Коротєєв запропонував додати такий рядок:
\ProvideTextCommandDefault{\cyrdash}{\hbox to.8em{--\hss--}}
% Як написано в документації,
% до пакунку babel-ukrainian версії 1.4b від 2017/08/10
% було додано таке означення.
% Суть проблеми в тому, що
% команда \cyrdash доступна тільки в кириличних кодуваннях шрифтів типу T2A,
% але недоступна в латинських кодуваннях.
% Тому, якщо поточна мова документа "--- англійська,
% то будь-яке явне чи неявне використання \cyrdash спричиняє помилку
% (див. документацію babel-ukrainian версії 1.4b або пізнішої, розділ~6.4.2, с.~10).
% На жаль, мені не вдалося відтворити проблему
% незважаючи на те, що на моїй машині старіша версія babel-ukrainian
% (версія 1.1l від 2008/03/21),
% і перевірити, як додавання вказаного рядка розв'язує цю проблему.
% Але за словами Вадима, це розв'язує проблему, яка виникла в нього.
% Тому я додав цей рядок, щоб запобігти можливим проблемам в інших користувачів.
% У майбутньому, якщо з'явиться більше інформації,
% спробую розкопати причину такої поведінки \cyrdash.
%
% Латки для vakthesis
%
% Василь Черлінка повідомив 2018/04/15 на форумі ЛОУ
% (https://linux.org.ua/index.php?topic=689.msg201933#msg201933),
% що використання переліків (оточення enumerate) спричиняє помилку
% з повідомленням про неозначену команду \@asbuk.
% Аналогічна ситуація з \@Asbuk.
% У класі vakthesis немає означень команд \@Asbuk і \@asbuk.
% Бо вони мали бути в babel.
% Але в babel-ukrainian, починаючи з версії 1.4 від 2017/06/10,
% вирішили викинути означення цих команд.
% Натомість переозначують команди \@Alph і \@alph з латинки на кирилицю.
% Додаємо означення.
\def\@Asbuk{\@Alph}
\def\@asbuk{\@alph}
% Якщо в користувача встановлено нову версію babel-ukrainian,
% де немає означень команд \@Asbuk і \@asbuk,
% то вони будуть поводитися, як \@Alph і \@alph відповідно.
% Якщо використовується стара версія babel-ukrainian,
% де є означення \@Asbuk і \@asbuk,
% то babel-ukrainian пізніше переозначить ці команди,
% і все працюватиме, як і раніше.
% Тут немає потреби використовувати \providecommand,
% як для переозначення в преамбулі (див. файл BUGS, повідомлення від 2018/04/15),
% бо на цьому етапі \@Asbuk і \@asbuk у будь-якому разі неозначені.
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Local Variables:
% mode: latex
% coding: windows-1251-dos
% End:
