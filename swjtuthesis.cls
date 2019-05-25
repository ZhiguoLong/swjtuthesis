\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swjtuthesis}

\LoadClass[UTF8,openany,zihao=-4]{ctexbook}

\RequirePackage{array}
\RequirePackage{zhnumber}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{scrextend}
\RequirePackage{titletoc}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{amsmath}
\RequirePackage[backend=biber, sorting=none, maxnames=99,
                style=gb7714-2015, gbnamefmt=lowercase,
                gbpub=false, gbfieldtype=true, gbpunctin=false]
                {biblatex}

% 定义参考文献类型字段
\DefineBibliographyStrings{english}{in={}}
\DefineBibliographyStrings{english}{incn={}}
\DefineBibliographyStrings{english}{mathesis={Master Thesis}}
\DefineBibliographyStrings{english}{phdthesis={Doctor Thesis}}
\DefineBibliographyStrings{english}{mathesiscn={硕士论文}}
\DefineBibliographyStrings{english}{phdthesiscn={博士论文}}

% 根据平台设置字体
% https://github.com/ustctug/ustcthesis/blob/6b2cd0c1f0cafa08d7d6cec927dbb73bad38ddc9/ustcthesis.cls#L88
\newcommand\strifeq{\csname str_if_eq_x:nnTF\endcsname}
\newcommand\fontset{\csname g__ctex_fontset_tl\endcsname}
\strifeq{\fontset}{fandol}{
    \setmainfont[
      Extension      = .otf,
      UprightFont    = *-regular,
      BoldFont       = *-bold,
      ItalicFont     = *-italic,
      BoldItalicFont = *-bolditalic,
    ]{texgyretermes}
    \setsansfont[
      Extension      = .otf,
      UprightFont    = *-regular,
      BoldFont       = *-bold,
      ItalicFont     = *-italic,
      BoldItalicFont = *-bolditalic,
    ]{texgyreheros}
    \setmonofont[
      Extension      = .otf,
      UprightFont    = *-regular,
      BoldFont       = *-bold,
      ItalicFont     = *-italic,
      BoldItalicFont = *-bolditalic,
      Scale          = MatchLowercase,
    ]{texgyrecursor}
}{}
\strifeq{\fontset}{windows}{
    \setCJKfamilyfont{zhhei}[AutoFakeBold,AutoFakeSlant]{SimHei}
    \setCJKfamilyfont{zhsong}[AutoFakeBold,AutoFakeSlant]{SimSun}
    \setCJKmainfont[AutoFakeBold,AutoFakeSlant]{SimSun}
}{}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\newfontfamily\arial{Arial}
\newfontfamily\timesnewroman{Times New Roman}

\geometry{a4paper,left=2.7cm,right=2.7cm,top=2.6cm,bottom=2.6cm}

% 页眉设置
% 重新定义 plain 格式，包含页眉
\let\oldheadrule\headrule
\renewcommand{\headrule}{\oldheadrule}
\renewcommand{\headrulewidth}{1.8pt}
\fancypagestyle{plain}{
    \fancyhead[L]{}
    \fancyhead[C]{\heiti 西南交通大学本科毕业设计（论文）}
    \fancyhead[R]{}
}

% 重新定义目录名
\renewcommand{\contentsname}{\heiti\Large 目\hspace{10bp}录}
\titlecontents{chapter}
    [3.8em]{\vspace{0.5em}}
    {\heiti\contentslabel{3.5em}}
    {\heiti\hspace*{-3.5em}}
    {\titlerule*[0.3pc]{.}\contentspage}
    [\vspace{0.5em}]

\titlecontents{section}
    [3.8em]{}
    {\songti\contentslabel{1.5em}}
    {\hspace*{-2.3em}}
    {\titlerule*[0.3pc]{.}\contentspage}

\titlecontents{subsection}
    [6.2em]{}
    {\songti\contentslabel{2.3em}}
    {\hspace*{-2.3em}}
    {\titlerule*[0.3pc]{.}\contentspage}

% 设置章节格式
\setcounter{secnumdepth}{3}
\ctexset{
    chapter = {
        format = \centering\heiti\Large,
        name = {第,章},
        number = \thechapter,
        aftername = \enspace,
        beforeskip = -15bp,
        afterskip = 20bp
    },
    section = {
        format = \heiti\large,
        numberformat = \arial\large,
        aftername = \hspace{4bp},
        indent = 0pt
    },
    subsection = {
        format = \heiti\zihao{4},
        numberformat = \timesnewroman\zihao{4},
        aftername = \hspace{4bp},
        indent = 0pt
    },
    subsubsection = {
        format = \heiti,
        numbering = true,
        numberformat = \timesnewroman,
        aftername = \hspace{4bp}
    }
}

% 重定义上标引用使得含有方括号
\DeclareCiteCommand{\supercite}[\mkbibsuperscript]
    {\usebibmacro{cite:init}%
        \let\multicitedelim=\supercitedelim
        \iffieldundef{prenote}
            {}
            {\BibliographyWarning{Ignoring prenote argument}}%
        \iffieldundef{postnote}
            {}
            {\BibliographyWarning{Ignoring postnote argument}}%
    \bibopenbracket}%
    {\usebibmacro{citeindex}%
     \usebibmacro{cite:comp}}
    {}
    {\usebibmacro{cite:dump}\bibclosebracket}

% 定义图表名格式
\captionsetup{
    labelsep = space,
    font = small
}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% 表格元素间距
\setlength{\tabcolsep}{18pt}
\renewcommand{\arraystretch}{1.5}

% 公式编号格式
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

% 带下划线盒子
\newcommand{\underlinebox}[3]{
    \underline{\makebox[#1][#2]{#3}}
}

% 标题页
\newcommand\grade[1]{\renewcommand\@grade{#1}}
\newcommand\@grade{\@latex@error{No \noexpand\grade given}\@ehc}
\newcommand\stunum[1]{\renewcommand\@stunum{#1}}
\newcommand\@stunum{\@latex@error{No \noexpand\stunum given}\@ehc}
\renewcommand\author[1]{\renewcommand\@author{#1}}
\renewcommand\@author{\@latex@error{No \noexpand\author given}\@ehc}
\newcommand\major[1]{\renewcommand\@major{#1}}
\newcommand\@major{\@latex@error{No \noexpand\major given}\@ehc}
\newcommand\instructor[1]{\renewcommand\@instructor{#1}}
\newcommand\@instructor{\@latex@error{No \noexpand\instructor given}\@ehc}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcommand{\maketitlepage}{
    \begin{titlepage}
    \vspace*{\stretch{0.5}}
    \begin{center}
        {
            \heiti\Large\ctexset{space=true}
            西 南 交 通 大 学\\[18bp]
            本科毕业设计（论文）\\[18bp]
        }
        \vfill
        % 论文题目
        {
            \heiti\LARGE
            \begin{tabular}{C{12cm}}
                \@title
            \end{tabular}
        } \\
        \vspace{\stretch{2}}
        % 个人信息
        {
            \heiti
            \setlength{\tabcolsep}{0.3em}
            \begin{tabular}{ll}
                年\hspace{24bp}级： & \underlinebox{4cm}{c}{\@grade}   \\
                学\hspace{24bp}号： & \underlinebox{4cm}{c}{\@stunum}  \\
                姓\hspace{24bp}名： & \underlinebox{4cm}{c}{\@author}  \\
                专\hspace{24bp}业： & \underlinebox{4cm}{c}{\@major}   \\
                指导老师：  & \underlinebox{4cm}{c}{\@instructor}    \\
            \end{tabular}

        }
        \vspace{\stretch{1.5}}
        % 当前日期
        {
            \heiti\zhdigits *{\the\year}年\zhdigits *{\the\month}月
        }
    \end{center}
    \vfill
    \end{titlepage}
    \clearpage\mbox{}\thispagestyle{empty}\clearpage
}

% 学术诚信声明
\newcommand{\makeais} {
    \begin{center}
        {
            \heiti\Large
            西南交通大学\\[18bp]
            本科毕业设计（论文）学术诚信声明\\[18bp]
        }
    \end{center}
    \vspace{\stretch{1}}
    \begin{spacing}{1.6}
        {
            \songti\zihao{4} 
            本人郑重声明：所呈交的毕业设计（论文），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律结果由本人承担。
        }
    \end{spacing}
    \vspace{\stretch{5}}
        \rightline{\songti\zihao{4}作者签名：\hspace{156bp}}
    \vspace{\stretch{1}}
        \rightline{\songti\zihao{4}日期：\hspace{36bp}年\hspace{24bp}月\hspace{24bp}日\hspace{60bp}}
    \vspace{\stretch{3}}
    \thispagestyle{empty}
    \clearpage\mbox{}\thispagestyle{empty}\clearpage
}


% 版权使用授权书
\newcommand{\makecua} {
    \thispagestyle{empty}
    \begin{center}
        {
            \heiti\Large
            西南交通大学\\[18bp]
            本科毕业设计（论文）版权使用授权书\\[18bp]
        }
    \end{center}
    \vspace{\stretch{1}}
    \begin{spacing}{1.6}
        {
            \zihao{4}
            本毕业设计（论文）作者同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权西南交通大学可以将本毕业设计（论文）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本毕业设计（论文）。
        }
    \end{spacing}
    \begin{spacing}{2.3}
        {
            \zihao{4}
            \hspace*{\stretch{7}} \textbf{保密}$\square$，在\rule[-2pt]{1.5cm}{0.3pt}年解密后适用本授权书。 \hspace{\stretch{2}}
            \newline
            \hspace*{\stretch{1}} 本论文属于 \hspace{\stretch{7}}
            \newline
            \hspace*{\stretch{7}} \textbf{不保密}$\square$。\hspace{\stretch{12}}
            \newline
            \hspace*{\stretch{4}}（请在以上方框内打“\checkmark”）\hspace{\stretch{19}}
        }
    \end{spacing}
    \vspace{\stretch{3}}
    \begingroup
    \zihao{4}
    \begin{tabular}{l@{\hskip 0.8in}l}
        作者签名：  &   指导老师签名：    \\[40bp]
        日期：\hspace{36bp}年\hspace{24bp}月\hspace{24bp}日 &   日期：\hspace{36bp}年\hspace{24bp}月\hspace{24bp}日\\
    \end{tabular}
    \endgroup
    \vfill
    \cleardoublepage
}

% 教师评估页
\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{\@latex@error{No \noexpand\department given}\@ehc}
\newcommand\class[1]{\renewcommand\@class{#1}}
\newcommand\@class{\@latex@error{No \noexpand\class given}\@ehc}
\newcommand\taskstartdate[1]{\renewcommand\@taskstartdate{#1}}
\newcommand\@taskstartdate{\@latex@error{No \noexpand\taskstartdate given}\@ehc}
\newcommand\taskenddate[1]{\renewcommand\@taskenddate {#1}}
\newcommand\@taskenddate{\@latex@error{No \noexpand\taskenddate given}\@ehc}
\newcommand{\makeevaluatepage}{
    \pagestyle{plain}
    \fancyfoot[C]{}

    \hskip -1.46cm
    \begin{tabular}{l@{\hskip 0.3in}l}
        院系 \underlinebox{6.2cm}{c}{\@department}    &   专业 \underlinebox{6.2cm}{c}{} \\
        年级 \underlinebox{6.2cm}{c}{\@grade} &   姓名 \underlinebox{6.2cm}{c}{}\\
    \end{tabular}
    \newline\newline
    题目 \underlinebox{14.4cm}{c}{}
    \newline

    \hskip -1.46cm
    \begin{tabular}{l@{\hskip 0.1in}l}
        指导教师            &   \\[6bp]
        评\hspace{24bp}语   &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \multicolumn{1}{r}{指导教师 \underlinebox{4cm}{c}{}(签章)}\\[10bp]
    \end{tabular}

    \hskip -1.46cm
    \begin{tabular}{l@{\hskip 0.1in}l}
        评\hspace{6bp}阅\hspace{6bp}人            &   \\[6bp]
        评\hspace{24bp}语   &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \underlinebox{13.6cm}{c}{}\\[6bp]
                            &   \multicolumn{1}{r}{评\hspace{6bp}阅\hspace{6bp}人 \underlinebox{4cm}{c}{}(签章)}\\[10bp]
    \end{tabular}
    \newline\newline\newline
    成\hspace{24bp}绩 \underlinebox{5.5cm}{c}{}\\[12bp]
    答辩委员会主任 \underlinebox{4.25cm}{c}{}(签章)\\[12bp]
    \rightline{年\hspace{20bp}月\hspace{20bp}日}
    \cleardoublepage
}

% 开始摘要前设置
\newcommand{\startabstract}{%
    \pagestyle{plain}
    \pagenumbering{Roman}
    \fancyfoot[C]{第 \thepage\ 页}
}

% 中文摘要
\newcommand\keywords[1]{\renewcommand\@keywords {#1}}
\newcommand\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}
\newenvironment{abstract}{%
    \mbox{}\newline
    \centerline{\heiti\Large 摘\hspace{6bp}要}
    \mbox{}\newline
    \hspace*{24bp}
    % TODO: 段落间距需要调整
    %\setlength{\baselineskip}{20pt}
}{%
    \leavevmode \newline \noindent {\heiti 关键词：}\@keywords
    \clearpage
}

% 英文摘要
\newcommand\enkeywords[1]{\renewcommand\@enkeywords {#1}}
\newcommand\@enkeywords{\@latex@error{No \noexpand\enkeywords given}\@ehc}
\newenvironment{enabstract}{%
    \mbox{}\newline
    \centerline{\heiti\Large Abstract}
    \hspace*{24bp}
}{%
    \leavevmode \newline \noindent {\bfseries Keywords: }\@enkeywords
    \clearpage
}

% 目录页
\newcommand{\maketot}{%
    \pagestyle{plain}
    \tableofcontents
    \clearpage
}

% 开始正文前设置
\newcommand{\startmainmatter}{%
    \pagestyle{plain}
    \pagenumbering{arabic}
    \fancyfoot[C]{第 \thepage\ 页}
}

% 生成参考文献
\newcommand{\makebackmatter}{%
    \backmatter
    \printbibliography[title=参考文献, heading=bibintoc]
}