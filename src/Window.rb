#==============================================================================
# ■ Window_Base
#------------------------------------------------------------------------------
# 　ゲーム中の全てのウィンドウのスーパークラスです。
#==============================================================================

class Window_Base < Window
  #--------------------------------------------------------------------------
  # ● 制御文字の事前変換
  #    実際の描画を始める前に、原則として文字列に変わるものだけを置き換える。
  #    文字「\」はエスケープ文字（\e）に変換。
  #--------------------------------------------------------------------------
  alias beunko_window_base_convert_escape_characters convert_escape_characters
  def convert_escape_characters(text)
    result = BeUnko::string(text.to_s)
    result = beunko_window_base_convert_escape_characters(result)
    result
  end
end

