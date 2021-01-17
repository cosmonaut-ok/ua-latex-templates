# PAST LaTeX class

Це клас для написання статтей для журналу ("ВОПРОСЫ АТОМНОЙ HАУКИ и ТЕХНИКИ(ВАНТ)")[https://vant.kipt.kharkov.ua/].

Використання класу відбувається простим підключенням `\documentclass{vant_article}` на початку документу.

Також, необхідно оформити сам документ у вигляді:

```latex
\documentclass{vant_article}

% opening
\title{The Title of Your Article}

\author{A. U. Thor}

\affil{affil}

\temail{first.author_s.email@mail.com}

\begin{document}

\maketitle

\begin{abstract}
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in
reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.
\end{abstract}

\pacs

\begin{multicols}{2}

Turpis egestas integer eget aliquet nibh. Dui accumsan sit amet nulla
facilisi morbi. Malesuada bibendum arcu vitae elementum. Laoreet non
curabitur gravida arcu ac. Adipiscing bibendum est ultricies integer
quis auctor elit sed vulputate. Libero volutpat sed cras ornare arcu
dui. Scelerisque purus semper eget duis at tellus. Fringilla ut morbi
tincidunt augue interdum velit euismod. Interdum posuere lorem ipsum
dolor sit amet consectetur adipiscing elit. Sit amet tellus cras
adipiscing enim eu turpis egestas. Id consectetur purus ut faucibus
pulvinar elementum integer. Sit amet nisl purus in mollis nunc sed.

\bibliography{../bibliography/plasma}

\end{multicols}

\taaotherlang{Назва Вашої Статті Українською} {А. В. Тор}
{Абстракт українською}

\taaotherlang{Название Статьи на русском} {А. В. Тор}
{Абстракт на руссокм}

\end{document}
```
