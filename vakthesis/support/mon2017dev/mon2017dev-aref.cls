%%% mon2017dev-aref.cls --- Оформлення автореферату дисертації згідно з вимогами МОН
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mon2017dev-aref}
  [2019/11/16 v0.01 vakaref support document class (OMB)]
% Означення опцій
\RequirePackage{xkeyval}
% Тип дисертації
\define@choicekey{mon2017dev-aref.cls}{type}[\val\nr]{c,d,phd,artd,scd}{%
  \ifcase\nr\relax
    \AtBeginDocument{%
      \addto\captionsenglish{%
        \def\degreename{candidate of}%
        \def\degreephdname{doctor of philosophy}%
      }%
      \addto\captionsrussian{%
        \def\degreename{\cyrk\cyra\cyrn\cyrd\cyri\cyrd\cyra\cyrt\cyra}%
        \def\degreephdname{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrf\cyri\cyrl\cyro\cyrs\cyro\cyrf\cyri\cyri}%
      }%
      \addto\captionsukrainian{%
        \def\degreename{\cyrk\cyra\cyrn\cyrd\cyri\cyrd\cyra\cyrt\cyra}%
        \def\degreephdname{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrf\cyrii\cyrl\cyro\cyrs\cyro\cyrf\cyrii\cyryi}%
      }%
    }%
  \or
    \AtBeginDocument{%
      \addto\captionsenglish{\def\degreename{doctor of}}%
      \addto\captionsrussian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra}}%
      \addto\captionsukrainian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra}}%
    }%
  \or
    \AtBeginDocument{%
      \addto\captionsenglish{\def\degreename{doctor of philosophy}}%
      \addto\captionsrussian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrf\cyri\cyrl\cyro\cyrs\cyro\cyrf\cyri\cyri}}%
      \addto\captionsukrainian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrf\cyrii\cyrl\cyro\cyrs\cyro\cyrf\cyrii\cyryi}}%
    }%
  \or
    \AtBeginDocument{%
      \addto\captionsenglish{\def\degreename{doctor of arts}}%
      \addto\captionsrussian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyri\cyrs\cyrk\cyru\cyrs\cyrs\cyrt\cyrv\cyra}}%
      \addto\captionsukrainian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrm\cyri\cyrs\cyrt\cyre\cyrc\cyrt\cyrv\cyra}}%
    }%
  \or
    \AtBeginDocument{%
      \addto\captionsenglish{\def\degreename{doctor of science}}%
      \addto\captionsrussian{\def\degreename{\cyrd\cyro\cyrk\cyrt\cyro\cyrr\cyra\ \cyrn\cyra\cyru\cyrk}}%
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
    \PassOptionsToClass{\val}{vakaref}%
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
\define@choicekey{mon2017dev-aref.cls}{instnameorder}{desc,asc,ascd}{%
  \def\set@institutions{\csname set@institutions@#1\endcsname}%
}
% Підключення модуля для підтримки специфічних вимог, рекомендацій
% окремого навчального закладу або наукової установи
% чи посібника, порадника з оформлення дисертації
\DeclareOptionX<mon2017dev-aref.cls>{guide}{%
  \IfFileExists{#1.clo}%
    {\AtEndOfClass{\input{#1.clo}}}%
    {\ClassError{\@classname}{You cannot use option `guide=#1'}%
       {File `#1.clo' not found.}}}
% Решту опцій перенаправляємо до vakaref
\DeclareOptionX*{%
  \PassOptionsToClass{\CurrentOption}{vakaref}%
}
\ExecuteOptionsX{type=c,instnameorder=desc}
\ProcessOptionsX
\LoadClass{vakaref}[2009/04/01]
\RequirePackage{environ}
% Пакунок suffix потрібен для означення команд з модифікаторами (uk), (en) тощо.
\RequirePackage{suffix}
% Щоб розкривати uk, en у повну назву мови.
\def\uklanguage{ukrainian}
\def\enlanguage{english}
\def\rulanguage{russian}
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
% Але тут не треба, бо його викликає клас vakaref.
% \RequirePackage{casus}
% \AtBeginDocument{\usepackage{casus}}
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
    \expandafter\g@addto@macro\csname @supervisors\@modifier\endcsname{\\{#1}{#2}{#3}}%
    \expandafter\def\csname @supervisors@caption\@modifier\endcsname{%
      \manysupervisorsname:%
    }%
  \else
    \expandafter\def\csname @supervisors\@modifier\endcsname{\\{#1}{#2}{#3}}%
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
  \expandafter\def\csname @council@address\@modifier\endcsname{#1}%
}
\define@key{council}{town}{%
  \expandafter\def\csname @council@town\@modifier\endcsname{#1}%
}
\renewcommand{\council}[2][]{%
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
\renewenvironment{listofpersons}[1]
  {\list{#1\hfil}{\topsep0pt\parsep0pt\itemsep.5\parskip
   \ifcsname @supervisors@\languagename\endcsname
     \settowidth\@tempdima{#1}%
     \setlength\labelwidth{\@tempdima}%
   \else
     \settowidth\@tempdima{\csname @supervisors@caption@\languagename\endcsname}
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
% Титульний аркуш
\renewcommand{\maketitle}{%
    \begin{titlepage}%
    % \@ifundefined{@council@institutiont}
    %   {\let\@council@institutiont\@council@institution}{\relax}%
    % \@ifundefined{@council@institutiont@office}
    %   {\let\@council@institutiont@office\relax}{\relax}%
    \begin{center}%
    \@makecover
    \end{center}%
    \newpage
    \parindent=0pt\relax
    \parskip=10pt plus 10pt minus 10pt
    \@makereverse
    \end{titlepage}%
}
% Команди для правильного розміщення на титульному аркуші назв установ
% залежно від вибраної опції
\def\set@institutions@desc{%
  {\scshape
   \ifcsname @council@institution@office@\languagename\endcsname
     \csname @council@institution@office@\languagename\endcsname\par
   \fi
   \csname @council@institution@\languagename\endcsname\par}
}
\def\set@institutions@asc{%
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
\def\degreefield@tf@russian#1{%
  \IfEndWith{#1}{\cyre}{%
    \StrGobbleRight{#1}{1}\cyrh\ \cyrn\cyra\cyru\cyrk
    % \case[adjective]{G}{#1} наук% не працює тут
  }{%
    \IfStrEqCase{#1}{%
      {\cyra\cyrr\cyrh\cyri\cyrt\cyre\cyrk\cyrt\cyru\cyrr\cyra}% архитектура
      {\StrGobbleRight{#1}{1}\cyrery}% \case{G}{#1} не працює тут
      {\cyrk\cyru\cyrl\cyrsftsn\cyrt\cyru\cyrr\cyro\cyrl\cyro\cyrg\cyri\cyrya}% культурология
      {\StrGobbleRight{#1}{1}\cyri}%
      {\cyri\cyrs\cyrk\cyru\cyrs\cyrs\cyrt\cyrv\cyro\cyrv\cyre\cyrd\cyre\cyrn\cyri\cyre}% искусствоведение% FIXME: не працює, бо закінчується на е, а отже, потрапляє в інший випадок
      {\StrGobbleRight{#1}{1}\cyrya}%
      {\cyrg\cyro\cyrs\cyru\cyrd\cyra\cyrr\cyrs\cyrt\cyrv\cyre\cyrn\cyrn\cyro\cyre\space
        \cyru\cyrp\cyrr\cyra\cyrv\cyrl\cyre\cyrn\cyri\cyre}% государственное управление% FIXME: не працює, бо закінчується на е, а отже, потрапляє в інший випадок
      {\cyrn\cyra\cyru\cyrk\ \cyrp\cyro\
        \cyrg\cyro\cyrs\cyru\cyrd\cyra\cyrr\cyrs\cyrt\cyrv\cyre\cyrn\cyrn\cyro\cyrm\cyru\
        \cyru\cyrp\cyrr\cyra\cyrv\cyrl\cyre\cyrn\cyri\cyryu}%
      {\cyrf\cyri\cyrz\cyri\cyrch\cyre\cyrs\cyrk\cyro\cyre\space
        \cyrv\cyro\cyrs\cyrp\cyri\cyrt\cyra\cyrn\cyri\cyre\space
        \cyri\space
        \cyrs\cyrp\cyro\cyrr\cyrt}% физическое воспитание и спорт
      {\cyrn\cyra\cyru\cyrk\ \cyrp\cyro\
        \cyrf\cyri\cyrz\cyri\cyrch\cyre\cyrs\cyrk\cyro\cyrm\cyru\
        \cyrv\cyro\cyrs\cyrp\cyri\cyrt\cyra\cyrn\cyri\cyryu\
        \cyri\
        \cyrs\cyrp\cyro\cyrr\cyrt\cyru}%
      {\cyrs\cyro\cyrc\cyri\cyra\cyrl\cyrsftsn\cyrn\cyrery\cyre\space
        \cyrk\cyro\cyrm\cyrm\cyru\cyrn\cyri\cyrk\cyra\cyrc\cyri\cyri}% социальные коммуникации
      {\cyrn\cyra\cyru\cyrk\ \cyrp\cyro\
        \cyrs\cyro\cyrc\cyri\cyra\cyrl\cyrsftsn\cyrn\cyrery\cyrm\
        \cyrk\cyro\cyrm\cyrm\cyru\cyrn\cyri\cyrk\cyra\cyrc\cyri\cyrya\cyrm}%
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
\def\@makecover{%
  \set@institutions
  \vspace{\stretch{3}}%
  {\bfseries\expandafter\expandafter\expandafter\emphsurname\csname @author@\languagename\endcsname \par}%
  \vspace{\stretch{2}}%
  {\raggedleft \CYRU\CYRD\CYRK\ \@udc \par}%
  \vspace{\stretch{1}}%
  {\large\bfseries\scshape \csname @title@\languagename\endcsname \par}%
  \vspace{\stretch{2}}%
  \set@speciality\par
  \vspace{\stretch{3}}%
  \CYRA\cyrv\cyrt\cyro\cyrr\cyre\cyrf\cyre\cyrr\cyra\cyrt\linebreak[1]%
  \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi\
    \cyrn\cyra\ \cyrz\cyrd\cyro\cyrb\cyru\cyrt\cyrt\cyrya\
    \cyrn\cyra\cyru\cyrk\cyro\cyrv\cyro\cyrg\cyro\
    \cyrs\cyrt\cyru\cyrp\cyre\cyrn\cyrya\linebreak[1]%
    \set@degree\par
  \vspace{\stretch{3}}%
  \ifcsname @council@town@\languagename\endcsname
    \csname @council@town@\languagename\endcsname
  \else
    \csname @towni@\languagename\endcsname
  \fi
  \ --- \@year}
\def\@makereverse{%
  \CYRD\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrie\cyryu\
    \cyrie\ \@thesistype.\par
  \CYRR\cyro\cyrb\cyro\cyrt\cyra\
    \cyrv\cyri\cyrk\cyro\cyrn\cyra\cyrn\cyra\ \cyrv\
% TODO: Перевірити вимоги до оформлення.
% Можливо, тут завжди треба писати повну назву відомства,
% а тому використання @institution@altname недоцільне?
    \ifcsname @institution@altname@\languagename\endcsname
      \iflanguage{ukrainian}%
        {\transformsentence{L}{\@institution@altname@ukrainian} }%
        {\csname @institution@altname@\languagename\endcsname}%
    \else
      \iflanguage{ukrainian}%
        {\transformsentence{L}{\@institution@ukrainian} }%
        {\csname @institution@\languagename\endcsname}%
      \ifcsname @institution@office@\languagename\endcsname
        \
        \iflanguage{ukrainian}%
          {\transformsentence{G}{\@institution@office@ukrainian} }%
          {\csname @institution@office@\languagename\endcsname}%
      \fi
    \fi
    .\par
  {\let\\\@format@person
   \ifcsname @supervisors@\languagename\endcsname
     \begin{listofpersons}{\@supervisors@caption}
       \csname @supervisors@\languagename\endcsname\relax
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
    \csname @council@code@\languagename\endcsname\
    \ifcsname @council@institution@altname@\languagename\endcsname
      \iflanguage{ukrainian}%
        {\transformsentence{G}{\@council@institution@altname@ukrainian} }%
        {\csname @council@institution@altname@\languagename\endcsname}%
    \else
      \iflanguage{ukrainian}%
        {\transformsentence{G}{\@council@institution@ukrainian} }%
        {\csname @council@institution@\languagename\endcsname}%
      \ifcsname @council@institution@office@\languagename\endcsname
        \
        \iflanguage{ukrainian}%
          {\transformsentence{G}{\@council@institution@office@ukrainian} }%
          {\csname @council@institution@office@\languagename\endcsname}%
      \fi
    \fi
    \ \cyrz\cyra\ \cyra\cyrd\cyrr\cyre\cyrs\cyro\cyryu:
    \csname @council@address@\languagename\endcsname.\par
  \vfil%\smallskip
  \CYRZ\ \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyrie\cyryu\
    \cyrm\cyro\cyrzh\cyrn\cyra\
    \cyro\cyrz\cyrn\cyra\cyrishrt\cyro\cyrm\cyri\cyrt\cyri\cyrs\cyrsftsn\
    \cyru\ \cyrb\cyrii\cyrb\cyrl\cyrii\cyro\cyrt\cyre\cyrc\cyrii\
    \ifx\@library@institution\@empty
      \ifcsname @council@institution@altname@\languagename\endcsname
        \iflanguage{ukrainian}%
          {\transformsentence{G}{\@council@institution@altname@ukrainian} }%
          {\csname\@council@institution@altname@\languagename\endscname}%
      \else
        \iflanguage{ukrainian}%
          {\transformsentence{G}{\@council@institution@ukrainian} \ \transformsentence{G}{\@council@institution@office@ukrainian} }%
          {\csname\@council@institution@\languagename\endscname\ of \csname\@council@institution@office@\languagename\endscname}%
      \fi
    \fi
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
% Abstract буде збиратися на місці, а не копіюватися і переноситися
\define@cmdkey{abstract}{language}{}
\define@cmdkey{abstract}{chapter}[true]{}
\define@boolkey{abstract}{header}[true]{}
\renewenvironment{abstract}[1][]{%
  \def\cmdKV@abstract@chapter{false}%
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
      \part{\abstractname}%
    \fi
  \else
    \part{\abstractname}%
  \fi
  \@mkboth{\MakeUppercase\abstractname}{\MakeUppercase\abstractname}%
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
  \ifcsname @council@institution@altname@\languagename\endcsname
    \csname @council@institution@altname@\languagename\endcsname
  \else
    \ifcsname @council@institution@\languagename\endcsname
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
% В авторефераті не треба повторювати відомості про апробацію.
% Але текст може бути скопійовано з дисертації.
% Тоді такі команди з'являться в авторефераті.
% Тому треба зробити для них безпечні заглушки.
% FIXME: Можна переписати, як означення звичайного оточення.
\NewEnviron{approval}[1][\approvalname]{%
  \paragraph{#1}%
  \BODY
}
\newcommand{\repeatapproval}{%
}
\def\approvalname{%
  % Апробація матеріалів дисертації
  {\cyr\CYRA\cyrp\cyrr\cyro\cyrb\cyra\cyrc\cyrii\cyrya\
    \cyrm\cyra\cyrt\cyre\cyrr\cyrii\cyra\cyrl\cyrii\cyrv\
    \cyrd\cyri\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyrii\cyryi}%
}%
% Цією командою позначаємо форму участі в конференції.
% Тоді можна зробити так, щоб у вступі не писати, а в додатку -- писати.
% В авторефераті -- як у вступі дисертації.
\newcommand{\participation}[1]{\unskip}
% Ця команда може бути в тексті, скопійованому з дисертації.
% Тому заглушка.
\newcommand{\repeatauthorpublications}{%
}
% Просто копія bibset з vakthesis (якщо комусь це треба).
\newcounter{needbibset}
\setcounter{needbibset}{1}
\newcounter{currbibset}
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
  {\equal{#1}{plain}\or\equal{#1}{unsrt}\or\equal{#1}{abbrv}\or
   \equal{#1}{amsplain}\or
   \equal{#1}{gost71s}\or\equal{#1}{gost71u}\or\equal{#1}{gost780s}\or\equal{#1}{gost780u}\or
   \equal{#1}{my_gost71s}}
  {\def\@biblabel##1{##1.}}
  {\def\@biblabel##1{[##1]}}}
% Зарезервовані слова (англійською, російською і українською)
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
\addto\captionsrussian{%
  \def\manuscriptname{%
    % Квалификационный научный труд на правах рукописи
    \CYRK\cyrv\cyra\cyrl\cyri\cyrf\cyri\cyrk\cyra\cyrc\cyri\cyro\cyrn\cyrn\cyrery\cyrishrt\
    \cyrn\cyra\cyru\cyrch\cyrn\cyrery\cyrishrt\
    \cyrt\cyrr\cyru\cyrd\
    \cyrn\cyra\
    \cyrp\cyrr\cyra\cyrv\cyra\cyrh\
    \cyrr\cyru\cyrk\cyro\cyrp\cyri\cyrs\cyri
  }%
  \def\set@thesisdescription{%
    % Диссертация на соискание научной степени
    % кандидата педагогических наук (доктора философии)
    \CYRD\cyri\cyrs\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyri\cyrya\
    \cyrn\cyra\
    \cyrs\cyro\cyri\cyrs\cyrk\cyra\cyrn\cyri\cyre\
    \cyrn\cyra\cyru\cyrch\cyrn\cyro\cyrishrt\
    \cyrs\cyrt\cyre\cyrp\cyre\cyrn\cyri\
    \set@degree\
    \cyrp\cyro\
    \cyrs\cyrp\cyre\cyrc\cyri\cyra\cyrl\cyrsftsn\cyrn\cyro\cyrs\cyrt\cyri\
    \set@abstract@speciality
  }%
  \def\keywordsname{\CYRK\cyrl\cyryu\cyrch\cyre\cyrv\cyrery\cyre\ \cyrs\cyrl\cyro\cyrv\cyra}%
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
