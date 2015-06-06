requires=rubygems,rubygems.defaults,rubygems.exceptions,rubygems.version,rubygems.requirement,rubygems.dependency,rubygems.gem_path_searcher,rubygems.source_index,rubygems.user_interaction,rubygems.specification,rubygems.platform,rubygems.spec_fetcher,rubygems.remote_fetcher,rubygems.digest.sha2,rubygems.source_info_cache,rubygems.source_info_cache_entry,rubygems.builder,rdoc,rdoc.markdown.entities
classes=RDoc=Markdown
methods=
sublibraries=rdoc.markdown.entities
is_sublibrary=true
category=

Markdown 形式で記述されたドキュメントを [[lib:rdoc]] 上で解析するための
サブライブラリです。

詳しくは以下を参照してください。

 * [[url:http://daringfireball.net/projects/markdown/syntax]]

Markdown 形式をデフォルトのフォーマットにする場合は、
[[ref:lib:rdoc#saved_options]] を参考に プロジェクトのデフォルトを
.rdoc_options ファイルで設定してください。

=== 拡張

以降の Markdown の拡張は [[c:RDoc]] のパーサ独自にサポートされているも
のです。ただし、全てがデフォルトで有効になっている訳ではありません。

==== RDoc

[[c:RDoc]] の Markdown のパーサは以下の無効にできない機能があります。

Underscores embedded in words are never interpreted as emphasis.  (While the
[markdown dingus][dingus] emphasizes in-word underscores, neither the
Markdown syntax nor MarkdownTest mention this behavior.)

また URL を記述すると HTML を出力する際に自動でリンクを作成します。URL
はそのまま表示されます。

==== Break on Newline

[[m:RDoc::Markdown#break_on_newline]] を設定する事で改行を保持した状態
で出力が行えます。詳しくは以下を参照してください。この拡張はデフォルト
では無効になっています。

 * Github Flavored Markdown: [[url:http://github.github.com/github-flavored-markdown/]]

==== CSS

[[m:RDoc::Markdown#css]] を設定する事で CSS を記述した場合に出力に含め
る事ができます。ただし、それを常に [[c:RDoc]] の出力に含める事はできま
せん。この拡張はデフォルトでは無効になっています。

例:

  <style type="text/css">
  h1 { font-size: 3em }
  </style>

==== 定義リスト

[[m:RDoc::Markdown#definition_lists]] を設定する事で定義リストを出力す
る事ができます。詳しくは以下を参照してください。この拡張はデフォルトで
有効になっています。

 * PHP Markdown Extra syntax: [[url:http://michelf.com/projects/php-markdown/extra/#def-list]]

例:

  cat
  :   A small furry mammal that seems to sleep a lot

  ant
  :   A little insect that is known to enjoy picnics

出力例:

: cat
  A small furry mammal that seems to sleep a lot

: ant
  A little insect that is known to enjoy picnics

==== Github

[[m:RDoc::Markdown#github]] を設定する事で Github Flavored Markdown 拡
張の一部を有効にして出力が行えます。詳しくは以下を参照してください。こ
の拡張はデフォルトで有効になっています。

 * Github Flavored Markdown: [[url:http://github.github.com/github-flavored-markdown/]]

上記の URL のうち以下のものがサポートされます。:

===== Fenced code block

コード周辺を「```」で囲む事で、4 スペースによるインデントの代わりになります。

===== シンタックスハイライト

コードを「``` ruby」と「```」で囲む事でシンタックスハイライトを有効にで
きます。(現在は Ruby のみがサポートされています)

==== HTML

[[m:RDoc::Markdown#html]] を設定する事で HTML を記述した場合にそのまま
出力する事ができます。この拡張はデフォルトで有効になっています。

例:

    <table>
    ...
    </table>

==== Notes

[[m:RDoc::Markdown#notes]] を設定する事で脚注を出力する事ができます。こ
の拡張はデフォルトで有効になっています。

例:

    Here is some text[^1] including an inline footnote ^[for short footnotes]

    ...

    [^1]: With the footnote text down at the bottom


=== 制限事項

 * リンクタイトルは使用されない
 * 画像へのリンクが正しく生成されない
 * 脚注は単一の段落にまとめられる

=== 著者

この Markdown パーサは John MacFarlane が開発した
peg-markdown([[url:https://github.com/jgm/peg-markdown]])を kpeg に移植
しました。

これは MIT ライセンスで提供されています。:

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

kpeg への移植は Eric Hodel と Evan Phoenix によって行われました。
