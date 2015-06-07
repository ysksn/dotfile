names=include
visibility=public 
kind=defined

--- include(*filenames) -> self

ファイル名のパターンを追加リストに登録します。
配列が与えられた場合、配列の各要素が追加されます。

@param filenames 追加するファイル名のパターンを指定します。

例:
   file_list.include("*.java", "*.cfg")
   file_list.include %w( math.c lib.h *.o )

