#!/bin/bash
set -eu 
#パラメーター展開中に、設定していない変数があったらエラーとする（特殊パラメーターである「@」と「*」は除く）
#パイプやサブシェルで実行したコマンドが1つでもエラーになったら直ちにシェルを終了する


cd typing
mix compile
mix dialyzer > log/dialyzer.log > log/dialyzer.err.log