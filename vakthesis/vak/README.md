README
vakthesis, набір класів і пакетів LaTeX, 2021/07/21 v0.09
In Ukrainian. See the end of the file for English summary.


ВІД УКЛАДАЧА
============

Це версія набору пакетів для написання авторефератів та дисертацій
згідно вимог Вищої атестаційної комісії, взятий з
https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/ з перекодованими
в UTF-8 символами для зручнішого користування на сучасних системах.


КОРОТКИЙ ОПИС
=============

Набір класів і пакетів LaTeX vakthesis призначений для оформлення
дисертації та автореферату за рекомендаціями ВАК України:
-- оформлення титульної сторінки дисертації (обкладинки автореферату),
-- оформлення заголовків розділів, підрозділів, пунктів, підпунктів,
   а також додатків,
-- нумерації сторінок, розділів (підрозділів і т. д.), ілюстрацій,
   таблиць, формул і т. д.,
-- оформлення підписів до ілюстрацій, таблиць,
-- оформлення теорем, лем, означень тощо,
-- оформлення списку використаних джерел та ін.

У поточній версії класи vakthesis і vakaref непридатні для оформлення
дисертацій та авторефератів згідно із сучасними вимогами Міністерства
освіти і науки України. Для цього призначені допоміжні класи mon2017dev
і mon2017dev-aref, які доступні за адресою:
  https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/support/mon2017dev/
Класи vakthesis та vakaref мають бути встановлені в системі. Але
користувачам немає потреби використовувати їх безпосередньо.

Версію 0.09 присвячено 115-річчю з дня народження Олени Теліги.


ЩО НОВОГО У ВЕРСІЇ 0.09
=======================

Додано:
-- Опцію для вибору різних рекомендацій до оформлення.

-- Перевірки, чи завантажено пакунок babel, перед використанням його
   команд типу \captionsukrainian, а також попередження про потребу
   використовувати пакунок babel з опцією ukrainian, якщо його
   не завантажено.

-- Факультативні аргументи для ненумерованих рубрик (тобто команд типу
   \chapter, \section тощо із зірочкою).
   (Олександр Червинський запитував про це.)

-- Заборону розриву рядка чи сторінки після заголовка структурної
   частини автореферату.
   (Сергій Лисовенко повідомив про цю проблему:
   https://linux.org.ua/index.php?topic=689.msg66449#msg66449)

-- Сумісні з пакунком hyperref варіанти команд \@spart, \@schapter
   і \@ssect.
   (Це, зокрема, розв'язує проблему з командою \section* (із зірочкою)
   і hyperref, про яку повідомив Олексій Панасенко.)

-- Команди \@addpunct, \nopunct, \frenchspacing з пакунка amsthm
   для гнучкої обробки знаків пунктуації в заголовках.
   (Це, зокрема, розв'язує проблему з неозначеною командою \@addpunct,
   про яку повідомив Андрій Боровий.)

-- Захисну команду \cyr в означеннях команд \theenumii і \theenumiv.
   (Це розв'язує проблему з недоступними командами \cyrzh і \CYRZH,
   про яку повідомив Андрій Боровий.)

-- Підтримку двох списків літератури до класу vakaref.

Змінено:
-- У файлах-прикладах і документації BibTeX-стилі на сумісні
   з ДСТУ 8302:2015.
   (basilio звернув увагу на це:
   https://linux.org.ua/index.php?topic=11311.msg201856#msg201856)

Вилучено:
-- Дубльоване з babel означення короткого пробілу між ініціалами.

Виправлено:
-- Проблему з пропущеним \or в означенні команди \bibliographystyle.
   (Сергій Шарапов повідомив про цю проблему.)

-- Перевірку завантаження пакунка hyperref в оточенні bibset.
   (Олексій Панасенко повідомив про цю проблему.)

-- Описки і помилки в документації
   (в інструкції зі створення кількох списків літератури і у файлі
   README).
   (Роман Нікіфоров і Дмитро Ситник повідомили про ці проблеми.)


ЗВАНТАЖЕННЯ
===========

Найновіша версія набору vakthesis доступна за адресою
  https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/
і складається з таких файлів
  README         (цей файл)
  vakthesis.dtx  документований код класів vakthesis, vakaref
                 та допоміжних файлів
  vakthesis.ins  інсталяційний файл
  vakthesis.pdf  попередньо скомпільована документація (цей файл не є
                 обов'язковим для звантаження і для розповсюдження,
                 він призначений лише для попереднього ознайомлення)


НЕОБХІДНІ КЛАСИ І ПАКЕТИ
========================

Для підтримки розміру шрифта 14pt потрібен файл size14.clo з набору
класів і пакетів extsizes, що доступний за адресою
  CTAN:macros/latex/contrib/extsizes
Достатньо встановити extsizes у системі. Немає потреби явно
використовувати якісь файли з цього набору.

Для підтримки опцій класу типу key=value потрібен пакет xkeyval,
що доступний за адресою
  CTAN:macros/latex/contrib/xkeyval


ВСТАНОВЛЕННЯ
============

  |Користувачам версій <0.07
  |-------------------------
  |
  |Всі попередні версії були приватними і вже не підтримуються.
  |Вони можуть бути несумісними з цією версією (змінено інтерфейс).
  |Тому я рекомендую користувачам попередніх версій:
  |* зробити резервні копії файлів встановленої версії класів
  |  і своїх документів,
  |* деінсталювати попередню версію,
  |* інсталювати поточну версію набору vakthesis,
  |* самостійно підправити свої документи так, щоб можна було
  |  використовувати поточну версію (документація може
  |  знадобитися для цього),
  |* якщо все гаразд, вилучити зроблені на першому кроці
  |  резервні копії.

1. «Розпакувати» .dtx-файл:
   latex vakthesis.ins

2. Якщо користувач бажає самостійно згенерувати документацію:
   latex vakthesis.dtx   
   або
   pdflatex vakthesis.dtx

3. Помістити файли туди, де TeX може їх знайти, наприклад (тут TEXMF
   позначає кореневий каталог (локального) дерева texmf):
   *.cls, *.clo, *.sty, speciality.*  ->  TEXMF/tex/latex/vakthesis
   vakthesis.{dvi,pdf}, README        ->  TEXMF/doc/latex/vakthesis
   xampl-*.*                          ->  TEXMF/doc/latex/vakthesis/example

4. Оновити базу імен файлів.


ВИКОРИСТАННЯ
============

Викликати, як стандартний клас документа:
  \documentclass{vakthesis}
або
  \documentclass{vakaref}
Більше інформації про нові та змінені опції та команди містить
документація: див. файл vakthesis.{dvi,pdf}.


АВТОРСЬКЕ ПРАВО І ЛІЦЕНЗІЯ
==========================

Copyright 2003--2009, 2021 Олександр М. Барановський (Oleksandr M. Baranovskyi)

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status `author-maintained'.

[Приблизний переклад українською:
Цю роботу можна розповсюджувати і/або модифікувати за
умовами публічної ліцензії проекту LaTeX, або версії 1.3
цієї ліцензії, або (на ваш розсуд) будь-якої пізнішої версії.
Найновіша версія цієї ліцензії є на
  http://www.latex-project.org/lppl.txt
і версія 1.3 або пізніша є частиною всіх дистрибутивів LaTeX
версії 2005/12/01 або пізніших.

Ця робота має LPPL-статус підтримки «підтримується автором».]


МАНІФЕСТ
========

Ця робота складається з файлів:
  vakthesis.dtx
  vakthesis.ins
  README (цей файл)
і похідних файлів:
  vakthesis.cls
  vakaref.cls
  vak2000bs.clo
  vak2007b6.clo
  vak2011b910.clo
  casus.sty
  speciality.20070212N70
  xampl-thesis.tex
  xampl-intro.tex
  xampl-ch1.tex
  xampl-concl.tex
  xampl-bib.tex
  xampl-aref.tex
  xampl-thesis.bib
  xampl-mybib.bib.


КОНТАКТНА ІНФОРМАЦІЯ
====================

Повідомлення про помилки і пропозиції нових можливостей, будь ласка,
надсилайте супровіднику:
Олександр Барановський
ombaranovskyi at gmail dot com


ENGLISH SUMMARY
===============

The vakthesis LaTeX bundle is intended for typesetting theses in the
official format required by the VAK of Ukraine (Vyshcha Atestatsiyna
Komisiya, i.e., High Certification Committee). It consists of two
LaTeX document classes, vakthesis and vakaref, and a few auxiliary
files.

One can download the latest version of the vakthesis on
  https://www.imath.kiev.ua/~baranovskyi/tex/vakthesis/
and use as any standard LaTeX document class.

This LaTeX bundle is distributed under the conditions of the LaTeX
Project Public License.

I suppose that the vakthesis bundle may be useful for Ukrainian users
only. Hence only Ukrainian documentation is available.

Please send bug reports and feature suggestions to maintainer:
Oleksandr Baranovskyi
ombaranovskyi at gmail dot com
