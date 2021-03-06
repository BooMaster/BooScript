﻿import UnityEditor

class CreateBooFile:
    static path = "Assets/"
    static classname = "HelloBoo"
    static ext  = ".boo"
    static code = """
import UnityEngine

class [classname] (MonoBehaviour):
    # このスクリプトのインデントはtabではなくスペース4つです
    # MonoDevelopを使っているなら左のSolutionからOptionを開き
    # Code Formationg > Boo source code > Convert tabs to spacesにチェックを入れてください
    
    # C#  ->  Boo
    # float型  float  ->  single
    # 型指定  int i = 0;  ->  i as int = 0
    # 配列の宣言  int[] i;  ->  i as (int)
    # 暗黙的型指定  var i = new Vector3();  ->  i = Vector3()
    # this  ->  self
    # else if  ->  elif
    # || && !  ->  or and not
    # foreach(var item in items){}  ->  for item in items:
    
    # GetComponentの書き方
    # C#  gameObject.GetComponent<Renderer>().material.SetColor("_Color", new Color(1f, 0f, 0f));
    # Boo gameObject.GetComponent[of Renderer]().material.SetColor("_Color", Color(1f, 0f, 0f))
    
    # コンストラクタ
    # C#  クラスと同じ名前のメソッド
    # Boo constructorというメソッド
    
    # ref outキーワード
    # Booはrefキーワードのみ
    #
    # def func(ref v as int):
    #     v = v * 2
    #
    # a as int 初期化せずにfancで表示しているがエラーにならない　intなら最初から0が入ってる
    # func(a) 関数を呼び出すときにはrefキーワードをつけない
    
    # 関数の型指定
    # C#  void Update(){}
    # Boo def Update() as void:
    
    # List(T)クラス
    # C#
    # List<int> list = new List<int>();  または  var list = new List<int>();
    # list.Add(1);
    # Boo
    # list as List[of int] = new List[of int]()  または  list = new List[of int]()
    # list.Add(1)
    
    # ３項演算子(条件演算子)
    # if(a == 0){
    #     i = 10;
    # else{
    #     i = 20;
    # }
    # 
    # C#  i = a == 0 ? 10 : 20;
    # Boo i = (10 if a == 0 else 20)
    
    def Start ():
        pass
    
    def Update ():
        pass
"""[1:-1]
    
    [MenuItem("Assets/Create/Boo Script")]
    static def Create():
        if not ClassName().Length == 0:
            code = code.Replace("[classname]", ClassName())
            sb = System.Text.StringBuilder()
            sb.Append(code)
            System.IO.File.WriteAllText(path+ClassName()+ext, sb.ToString(), System.Text.Encoding.UTF8)
            AssetDatabase.Refresh(ImportAssetOptions.ImportRecursive)
        
    static private def ClassName() as string:
        if not System.IO.File.Exists(path+classname+ext):
            return classname
        else:
            for i in range(1,10):
                if not System.IO.File.Exists(path+classname+i.ToString()+ext):
                    return classname+i.ToString()
        return ""
