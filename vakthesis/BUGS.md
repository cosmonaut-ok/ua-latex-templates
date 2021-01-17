BUGS 2019/06/23
vakthesis, набір класів і пакетів LaTeX

Історія повідомлень про помилки і виправлень

Позначення:
 - ще відкрита проблема
 * вже розв'язана проблема


 - Використання переліків (оточення enumerate) спричиняє помилку:
   Undefined control sequence.
   \theenumii -> \@asbuk
                         \c@enumii
   Тобто не означено команду \@asbuk. Аналогічна ситуація з \@Asbuk.
   Повідомлено 2018/04/15 --- Василь Черлінка
   https://linux.org.ua/index.php?topic=689.msg201933#msg201933

   У класі vakthesis немає означень команд \@Asbuk і \@asbuk. Бо вони
   мали бути в babel. Але в babel-ukrainian, починаючи з версії v1.4
   від 2017/06/10, вирішили викинути означення цих команд. Натомість
   переозначують команди \@Alph і \@alph з латинки на кирилицю.

   Тест-файл:

   \documentclass{vakthesis}

   \usepackage[T2A]{fontenc}
   \usepackage[utf8]{inputenc}
   \usepackage[ukrainian]{babel}

   \begin{document}
   \begin{enumerate}
   \item Test1
     \begin{enumerate}
     \item Test11
       \begin{enumerate}
       \item Test111
         \begin{enumerate}
         \item Test1111
         \item Test1112
         \item Test1113
         \end{enumerate}
       \item Test112
       \item Test113
       \end{enumerate}
     \item Test12
     \item Test13
     \end{enumerate}
   \item Test2
   \item Test3
   \end{enumerate}
   \end{document}

   Обхід: додати до преамбули документа

   \makeatletter
   \let\@Asbuk\@Alph
   \let\@asbuk\@alph
   \makeatother

   Тоді команди типу asbuk будуть доступні, і вони будуть поводитися,
   як команди типу alph.

   Оновлено 2019/06/23: таке переозначення не працює, кирилиці у
   нумерованих переліках немає.

   Переозначення команд \@Alph і \@alph з латинки на кирилицю, введене
   в babel-ukrainian версії v1.4 від 2017/06/10, зроблено так, що ці
   команди перемикаються на кирилицю тільки після перемикання мови
   (скажімо, з англійської на українську).

   Тому, якщо зробити переозначення з \let, скажімо, в преамбулі
   документа (до перемикання на українську мову), то команди типу
   asbuk будуть поводитися, як «стандартні» команди типу alph (тобто
   будуть використовуватися латинські букви в переліках).

   Треба замість \let використовувати \def:

   \makeatletter
   \def\@Asbuk{\@Alph}
   \def\@asbuk{\@alph}
   \makeatother

   Тоді команди типу asbuk будуть просто викликати команди типу alph у
   належному контексті (тобто в переліках будуть латинські чи
   кириличні букви, залежно від того, яку мову підключено).

   А щоб переозначення не залежало від версії babel-ukrainian (тобто
   коректно працювало і в нових версіях, де немає команд типу asbuk, і
   в старих, де такі команди є), треба замість \let використовувати
   \providecommand:

   \makeatletter
   \providecommand{\@Asbuk}{\@Alph}
   \providecommand{\@asbuk}{\@alph}
   \makeatother

   Тоді, якщо команди типу asbuk означені, то їхні означення не
   змінюються.

 - Документація (підрозділ 4.7, с. 10) пропонує виконати команду
     bibtex8 --csfile 1251cyr --big thesis
   Але BibTeX8 повідомляє, що не може відкрити файл 1251cyr.csf.
   Повідомлено 2011/02/05 --- Роман Нікіфоров

   Файл 1251cyr.csf не є публічним і згадка про нього залишилася в
   тексті через недогляд. Замість нього можна використовувати файли з
   набору BibTeX-стилів gost: cp1251.csf, koi8u.csf чи ruscii.csf
   (залежно від кодування документа). Тобто необхідно виконати
   команду, наприклад,
     bibtex8 --csfile cp1251 --big thesis

 - Клас vakaref не підтримує кодування UTF-8.
   Повідомлено 2011/02/01 --- Антон Каспіржний і Олександр Бондаренко

   Проблеми спричиняють команда \council (в її означенні є рядок з
   кириличною буквою: \catcode`м=11) і допоміжний пакет casus
   (алгоритм аналізу назв установ не працює, якщо текст в унікоді).

   Тест-файл:

   \documentclass{vakaref}

   \usepackage[T2A]{fontenc}
   \usepackage[utf8]{inputenc}
   \usepackage[ukrainian]{babel}

   \begin{document}
   \council{Д~26.206.01}
     [Інститут математики, Національна академія наук України]
     {Інститут математики НАН України}
     {01601 м.~Київ, вул.~Терещенківська, 3}
   \maketitle
   \end{document}

   Обхід: 1) додати до преамбули документа

   \makeatletter
   \renewcommand{\council}[1]{%
     \def\@council@code{#1}%
     \@ifnextchar[\o@council\@council}
   \AtBeginDocument{%
     \renewcommand{\transformsentence}[2]{#2\ignorespaces}%
   }
   \makeatother

   (Таке переозначення команди \transformsentence спричиняє іншу
   проблему: назви установ тепер не відмінюються. Можна або відразу в
   документі задавати назви установ у потрібному відмінку, або
   переозначити команду \@makereverse, або не використовувати взагалі
   команд \maketitle, \title, \author тощо.)

   або

   2) не використовувати кодування UTF-8.

 - Заголовок структурної частини автореферату (команда \part) може
   відриватися від наступного тексту.
   Повідомлено 2010/04/15 --- Сергій Лисовенко

   Команда \@part (і \@spart) не має ніяких можливостей, щоб запобігти
   відриванню наступного абзацу. Ймовірно, тому що код запозичено зі
   стандартного класу report, у якому аргумент команди \part
   оформлюється окремою сторінкою, а отже, така проблема не виникає.

   Тест-файл:

   \documentclass{vakaref}

   \usepackage[T2A]{fontenc}
   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}
   \usepackage{lipsum}

   \begin{document}
   \lipsum[1-2]
   Текст перед заголовком. Ще трохи тексту. Ще трохи тексту. Ще трохи
   тексту. Ще трохи тексту. Ще трохи тексту. Ще трохи тексту.
   \part{Заголовок}
   \lipsum[3]
   \end{document}

   Обхід: 1) перед \part додати \newpage і/або переписати попередній
   текст

   або

   2) додати до преамбули документа виправлену команду \@part (з
   викликом \nobreak):

   \makeatletter
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
          \par
        \fi
        \normalsize \bfseries \@make@chapapp{#2}\par\nobreak}%
       \vskip 9\p@}
   \makeatother

   Аналогічно виправити \@spart, якщо використовується \part*.

 - Якщо підключити пакет hyperref і використовувати оточення bibset,
   то команди \cite не будуть гіперлінками на відповідні джерела з
   бібліографії (але будуть вказувати на початок документа).
   Повідомлено 2010/02/05 --- Олексій Панасенко

   Оточення bibset, щоб дізнатися, що підключено пакет hyperref,
   перевіряє, чи означено команду \hyper@warn. Така команда була у
   старіших версіях hyperref, але зараз її вже немає (під час тесту
   використовувався hyperref v6.77g від 2007/11/20). Тому відповідний
   код не виконується ніколи.

   Тест-файл:

   \begin{filecontents}{test1-bib.bib}
   @Article{thor09,
     author =	 {A. U. Thor},
     title =	 {Title of the article},
     journal =	 {Test J.},
     year =	 2009,
     volume =	 3,
     number =	 1,
     pages =	 {23--45}
   }
   \end{filecontents}

   \begin{filecontents}{test2-bib.bib}
   @Article{thor10,
     author =	 {A. U. Thor},
     title =	 {Title of the article 2},
     journal =	 {Test J.},
     year =	 2010,
     volume =	 4,
     number =	 1,
     pages =	 {3--24}
   }
   \end{filecontents}

   \documentclass{vakthesis}

   \usepackage[T2A]{fontenc}
   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}
   \usepackage[unicode]{hyperref}

   \begin{document}
   Трохи тексту.
   \newpage
   У статті~\cite{thor09} щось написано.
   А в статті~\cite{thor10} доведено теорему.
   \begin{bibset}{Test 1}
   \bibliographystyle{gost71u}
   \bibliography{test1-bib}
   \end{bibset}
   \begin{bibset}[z]{Test 2}
   \bibliographystyle{gost71u}
   \bibliography{test2-bib}
   \end{bibset}
   \end{document}

   Обхід: додати до преамбули документа після виклику hyperref

   \makeatletter
   \@ifundefined{hyper@warn}{\let\hyper@warn\Hy@WarningNoLine}\relax
   \makeatother

 - Використання BibTeX-стилю gost780u разом з класами
   vakthesis/vakaref дає неочікуваний символ = (дорівнює) перед
   списком літератури. Зі стилем gost780s такої проблеми немає.
   Повідомлено 2009/09/05 --- Сергій Шарапов

   В означенні команди \bibliographystyle загублено \or якраз після
   порівняння аргумента з gost780u.

   Тест-файл:

   \begin{filecontents}{test-bib.bib}
   @Article{thor09,
     author =	 {A. U. Thor},
     title =	 {Title of the article},
     journal =	 {Test J.},
     year =	 2009,
     volume =	 3,
     number =	 1,
     pages =	 {23--45}
   }
   \end{filecontents}

   \documentclass{vakthesis}

   \usepackage[T2A]{fontenc}
   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}

   \begin{document}
   \nocite{*}
   \bibliographystyle{gost780u}
   \bibliography{test-bib}
   \end{document}

   Обхід: 1) закоментувати команду \bibliographystyle в тексті (після
   того, як список літератури уже згенеровано)

   або

   2) додати до преамбули документа виправлену команду
   \bibliographystyle:

   \makeatletter
   \def\bibliographystyle#1{%
     \ifx\@begindocumenthook\@undefined\else
       \expandafter\AtBeginDocument
     \fi
       {\if@filesw
          \immediate\write\@auxout{\string\bibstyle{#1}}%
        \fi}%
     \ifthenelse
     {\equal{#1}{plain}\or\equal{#1}{unsrt}\or\equal{#1}{abbrv}\or
      \equal{#1}{amsplain}\or
      \equal{#1}{gost71s}\or\equal{#1}{gost71u}\or
      \equal{#1}{gost780s}\or\equal{#1}{gost780u}}
     {\def\@biblabel##1{##1.}}
     {\def\@biblabel##1{[##1]}}}
   \makeatother

   Тут взагалі вилучено порівняння з my_gost71s, перед яким не було
   \or. Цей файл не є публічним і залишився в коді через недогляд.

 - Якщо підключити пакет hyperref, то команда \section* (із зірочкою)
   приводить до незрозумілого повідомлення про помилку.
   Повідомлено 2009/07/13 --- Олексій Панасенко

   Команда \section* ґрунтується на команді \@ssect, яку vakthesis
   переозначує так, що змінюється кількість аргументів. Пакет hyperref
   всі переозначення робить дуже обережно, але не може передбачити, що
   змінилася кількість аргументів команди \@ssect. Незрозумілі
   повідомлення про помилки виникають ще тоді, коли .toc-файл
   пишеться, тобто навіть без команди \tableofcontents у тексті.

   Тест-файл:

   \documentclass{vakthesis}

   \usepackage[T2A]{fontenc}
   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}
   \usepackage[unicode]{hyperref}

   \begin{document}
   \tableofcontents
   \chapter{Розділ з номером}
   \section{Підрозділ з номером}
   Тест
   \section*{Підрозділ без номера}
   Тест
   \chapter*{Розділ без номера}
   Тест
   \end{document}

   Обхід: додати до преамбули документа після виклику hyperref
   виправлені версії команд:

   \makeatletter
   \@ifpackageloaded{hyperref}{%
     \def\@ssect#1#2#3#4#5#6{%
       \phantomsection
       \H@old@ssect{#1}{#2}{#3}{#4}{#5}{#6}%
     }
     \def\@schapter#1{%
       \begingroup
         \let\@mkboth\@gobbletwo
         \Hy@GlobalStepCount\Hy@linkcounter
         \xdef\@currentHref{\Hy@chapapp*.\the\Hy@linkcounter}%
         \Hy@raisedlink{%
           \hyper@anchorstart{\@currentHref}\hyper@anchorend
         }%
       \endgroup
       \H@old@schapter{#1}%
     }%
   }{}
   \makeatother

   Якщо додати аргументів до означення команди \@ssect з пакета
   hyperref, то повідомлення про помилки зникають. Але гіпермітки для
   ненумерованих підрозділів чомусь розставляються неправильно, і
   гіперпосилання показують не туди. Якщо змінити порядок команд в
   означенні \@ssect, то наче все працює. З таких самих міркувань я
   змінив порядок також у hyperref'івському означенні \@schapter.

   Цей (чи подібний) код після додаткових тестувань буде додано до
   наступної версії vakthesis.

 - Неможливо використовувати факультативні аргументи разом з командами
   для ненумерованих рубрик (тобто командами із зірочкою).
   Повідомлено 2009/06/09 --- Олександр Червинський

   У стандартному класі report команда із зірочкою не додає свій
   аргумент до змісту. Тому факультативний аргумент просто не
   використовується. Ця стандартна поведінка має бути змінена у
   vakthesis, бо тут команди із зірочками генерують рубрику без
   номера, але у зміст її додають.

   Але це відразу спричинить несумісність документів, підготованих для
   vakthesis, зі стандартними класами. Що з цим робити?

   Тест-файл:

   \documentclass{vakthesis}

   \usepackage[T2A]{fontenc}
   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}

   \begin{document}
   \tableofcontents
   \chapter*[Назва розділу у змісті]{Назва розділу без номера}
   \section*[Назва підрозділу у змісті]{Назва підрозділу без номера}
   \end{document}

 - Залежність оформлення змісту (горизонтальні відступи після
   родо-нумераційного заголовка розділу/додатка) від того, чи команди
   \chapter розміщені у вкладених файлах, чи у головному файлі.
   Повідомлено 2009/05/18 --- Олександр Барановський

   Ймовірно, проблема пов'язана з командою \appendix, яка спеціально
   переозначується, щоб обходити неправильний порядок запису в
   .toc-файл, якщо вона викликається в головному файлі.

   Тест-файл 1:

   \begin{filecontents}{test-cha.tex}
   \chapter{Назва розділу}
   \end{filecontents}

   \begin{filecontents}{test-app.tex}
   \chapter{Назва додатка}
   \end{filecontents}

   \documentclass{vakthesis}

   \usepackage[T2A]{fontenc}
   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}

   \begin{document}
   \tableofcontents
   \include{test-cha}
   \appendix
   \include{test-app}
   \end{document}

   Тест-файл 2:

   \documentclass{vakthesis}

   \usepackage[T2A]{fontenc}
   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}

   \begin{document}
   \tableofcontents
   \chapter{Назва розділу}
   \appendix
   \chapter{Назва додатка}
   \end{document}

 - Неозначені команди
     \@asbuk,
     \@Asbuk,
     \addto,
     \captionsukrainian,
     \declare@shorthand,
   якщо у документі не викликається пакет babel.
   Повідомлено 2009/05/18 --- Олександр Барановський

   vakthesis необачно припускає, що babel завжди викликається, і без
   перевірки використовує його команди.

   Тест-файл:

   \documentclass{vakthesis}

   \begin{document}
   Test
   \end{document}

   Обхід: завжди викликати пакет babel (а також fontenc та inputenc).

 - Використання команди \subsection приводить до повідомлення про
   неозначену команду \@addpunct.
   Повідомлено 2009/05/08 --- Андрій Боровий

   Команда \@addpunct насправді означена у файлі amsgen.sty (або у
   пакеті amsthm). Але vakthesis не перевіряє, чи команда
   означена. Якщо в документі викликається amsthm або якісь пакети, що
   викликають amsgen (наприклад, amsmath), то проблему не
   видно. Аналогічна ситуація з командою \nopunct. Необхідно зробити
   перевірку, чи означені ці команди, і давати означення, якщо
   потрібно.

   Тест-файл:

   \documentclass{vakthesis}

   \usepackage[T2A]{fontenc}
   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}

   \begin{document}
   \chapter{Chapter test}
   \section{Section test}
   \subsection{Subsection test}
   Text test.
   \end{document}

   Обхід: додати у преамбулу документа означення команд:
   \makeatletter
   \def\@addpunct#1{\ifnum\spacefactor>\@m \else#1\fi}
   \makeatother
   \def\nopunct{\spacefactor 1007 }

 - Команди \cyrzh і \CYRZH недоступні в кодуванні OT1.
   Повідомлено 2009/05/08 --- Андрій Боровий

   Причину наразі не з'ясовано. Можливо, це пов'язано з використанням
   кириличних літер на другому і четвертому рівнях нумерованих
   переліків.

   Тест-файл:

   \documentclass{vakthesis}

   \usepackage[cp1251]{inputenc}
   \usepackage[ukrainian]{babel}

   \begin{document}
   Тест
   \end{document}

   Обхід: додати у преамбулу документа
   \usepackage[T2A]{fontenc}

2009/04/01: випуск v0.08 

 * Якщо не вказувати явно опцію розміру шрифта при виклику класу
   vakthesis (чи vakaref), а потім викликати пакет extsizes, отримуємо
   повідомлення, що файл size4.clo не знайдено.
   Повідомлено 2008/07/23 --- Роман Нікіфоров

   Це пов'язано з тим, що vakthesis використовує лише одну цифру з
   розміру шрифта, а пакет extsizes використовує дві, але не
   переозначує команду \@ptsize, якщо викликається без опцій.

   Розв'язання: не викликати пакет extsizes (він просто не потрібен).
   (v0.08) У документації, здається, чіткіше написано про це.

 * Використання \\ в аргументі команди \section викликає помилку.
   Повідомлено 2008/07/22 --- Григорій Торбін

   Причина в тому, що у змісті команда \\ переозначується у крихку і
   це переозначення не скасовується після змісту.

   Розв'язання: (v0.08) Крихке означення скасовується після змісту.

 * Немає безпечної обробки ситуації, коли файл size14.clo не
   встановлений у системі.

   Розв'язання: (v0.08) Додано перевірку наявності файла size14.clo.

 * В анотаціях (автореферат) у режимі чернетки дати пишуться
   відповідною мовою, а не мовою документа.

   Розв'язання: (v0.08) Використовувати оточення otherlanguage* для
   перемикання мови. Але потрібне інше розв'язання, якщо в тексті
   анотацій будуть інші зарезервовані слова.

2008/01/08: випуск v0.07
