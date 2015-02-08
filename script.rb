#==============================================================================
# ■ DataManager
#------------------------------------------------------------------------------
# 　データベースとゲームオブジェクトを管理するモジュールです。ゲームで使用する
# ほぼ全てのグローバル変数はこのモジュールで初期化されます。
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # ● データ内の文字列書換
  #--------------------------------------------------------------------------
  def self.rewrite_strings_to_unko(data)
    if data.nil? then
      return
    end
    if data.respond_to?(:name)          then data.name         = "うんこ" end
    if data.respond_to?(:nickname)      then data.nickname     = "うんこ" end
    if data.respond_to?(:message1)      then data.message1     = BeUnko::string(data.message1) end
    if data.respond_to?(:message2)      then data.message2     = BeUnko::string(data.message2) end
    if data.respond_to?(:message3)      then data.message3     = BeUnko::string(data.message3) end
    if data.respond_to?(:message4)      then data.message4     = BeUnko::string(data.message4) end
    if data.respond_to?(:description)   then data.description  = BeUnko::string(data.description) end
    data
  end
  #--------------------------------------------------------------------------
  # ● 通常のデータベースをロード
  #--------------------------------------------------------------------------
  class << self
    alias :beunko_datamanager_load_normal_database :load_normal_database unless method_defined?(:beunko_datamanager_load_normal_database)
  end
  def self.load_normal_database
    beunko_datamanager_load_normal_database()
    $data_system.game_title = "うんこ"
    $data_actors.map!      {|data| rewrite_strings_to_unko(data)}
    $data_classes.map!     {|data| rewrite_strings_to_unko(data)}
    $data_skills.map!      {|data| rewrite_strings_to_unko(data)}
    $data_items.map!       {|data| rewrite_strings_to_unko(data)}
    $data_weapons.map!     {|data| rewrite_strings_to_unko(data)}
    $data_armors.map!      {|data| rewrite_strings_to_unko(data)}
    $data_enemies.map!     {|data| rewrite_strings_to_unko(data)}
    $data_states.map!      {|data| rewrite_strings_to_unko(data)}
  end
  #--------------------------------------------------------------------------
  # ● 戦闘テスト用のデータベースをロード
  #--------------------------------------------------------------------------
  def self.load_battle_test_database
    $data_actors.map!      {|data| rewrite_strings_to_unko(data)}
    $data_classes.map!     {|data| rewrite_strings_to_unko(data)}
    $data_skills.map!      {|data| rewrite_strings_to_unko(data)}
    $data_items.map!       {|data| rewrite_strings_to_unko(data)}
    $data_weapons.map!     {|data| rewrite_strings_to_unko(data)}
    $data_armors.map!      {|data| rewrite_strings_to_unko(data)}
    $data_enemies.map!     {|data| rewrite_strings_to_unko(data)}
    $data_states.map!      {|data| rewrite_strings_to_unko(data)}
  end
end

#==============================================================================
# ■ Game_Troop
#------------------------------------------------------------------------------
# 　敵グループおよび戦闘に関するデータを扱うクラスです。バトルイベントの処理も
# 行います。このクラスのインスタンスは $game_troop で参照されます。
#==============================================================================
class Game_Troop < Game_Unit
  #--------------------------------------------------------------------------
  # ● 敵キャラ名の後ろにつける文字の表
  #--------------------------------------------------------------------------
  LETTER_TABLE_HALF = [' U',' N',' K',' O',' B',' U',' R',' I']
  LETTER_TABLE_FULL = ['Ｕ','Ｎ','Ｋ','Ｏ','Ｂ','Ｕ','Ｒ','Ｉ']
end

#==============================================================================
# ■ Game_Map
#------------------------------------------------------------------------------
# 　マップを扱うクラスです。スクロールや通行可能判定などの機能を持っています。
# このクラスのインスタンスは $game_map で参照されます。
#==============================================================================
class Game_Map
  #--------------------------------------------------------------------------
  # ● 表示名の取得
  #--------------------------------------------------------------------------
  def display_name
    "うんこ"
  end
end

# coding: utf-8

module BeUnko
  #-------------------
  # Utility
  #-------------------
  def self.max_cyclic(org, max)
    return (org <= max) ? org : 0
  end
  def self.max_stop(org, max)
    return (org <= max) ? org : max
  end
  #-------------------
  # module_function(s)
  #-------------------
  module_function
  #
  # convert string
  #
  def string(org)
    if false == org.kind_of?(String) then
      return org
    end
    serial = 0;
    last_type = '-'
    result = ""
    # convert
    org.split(//).each{|ch|
      # ひらがな
      if    /\p{Hiragana}/ =~ ch then
        # 小書き文字
        if /[ぁぃぅぇぉっゃゅょゎ]/ =~ ch then
          replace = ['ぅ','っ','ぉ']
          serial = ('hira'==last_type) ? serial : 0;
        # ナミ字
        else
          replace = ['う','ん','こ']
          serial = ('hira'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'hira'
      # カタカナ
      elsif /\p{Katakana}/ =~ ch then
        # 小書き文字
        if /[ァィゥェォヵヶッャュョヮ]/ =~ ch then
          replace = ['ゥ','ッ','ォ']
          serial = ('kata'==last_type) ? serial : 0;
        # 小書き文字(半角)
        elsif /[ｧｨｩｪｫヵヶｯｬｭｮヮ]/ =~ ch then
          replace = ['ｩ','ｯ','ｫ']
          serial = ('kata'==last_type) ? serial : 0;
        # ナミ字(半角)
        elsif /[ｱ-ﾝ]/ =~ ch then
          replace = ['ｳ','ﾝ','ｺ']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        # ナミ字
        else
          replace = ['ウ','ン','コ']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'kata'
      # 漢字
      elsif /[一-龠々]/ =~ ch then
        ch = '糞'
        last_type = 'kanji'
      # アルファベット
      elsif /[a-zａ-ｚA-ZＡ-Ｚ]/ =~ ch then
        # 小文字(半角)
        if /[a-z]/ =~ ch then
          replace = ['u','n','k','o']
        # 小文字(全角)
        elsif /[ａ-ｚ]/ =~ ch then
          replace = ['ｕ','ｎ','ｋ','ｏ']
        # 大文字(半角)
        elsif /[A-z]/ =~ ch then
          replace = ['U','N','K','O']
        # 大文字(全角)
        else
          replace = ['Ｕ','Ｎ','Ｋ','Ｏ']
        end
        serial = ('alpha'==last_type) ? max_stop(serial+1,replace.length-1) : 0;
        ch = replace[serial]
        last_type = 'alpha'
      # 継続
      elsif /[ー―～・]/ =~ ch then
        # last_type更新しない
      # 継続(半角スペースに変換)
      elsif /[ﾟﾞ]/ =~ ch then
        # last_type更新しない
        ch = " "
      # その他
      else
        last_type = '-'
      end
      
      result = result + ch.to_s
    }
    
    return result
  end
end


#==============================================================================
# ■ Vocab
#------------------------------------------------------------------------------
# 　用語とメッセージを定義するモジュールです。定数でメッセージなどを直接定義す
# るほか、グローバル変数 $data_system から用語データを取得します。
#==============================================================================

module Vocab

  # ショップ画面
  ShopBuy         = "うんこ"
  ShopSell        = "うんこ"
  ShopCancel      = "うんこ"
  Possession      = "うーんこ"

  # ステータス画面
  ExpTotal        = "うんーこ"
  ExpNext         = "うんこ %s"

  # セーブ／ロード画面
  SaveMessage     = "うんこうんこウーンコ？"
  LoadMessage     = "うんこうんこウーンコ？"
  File            = "うんこ"

  # 複数メンバーの場合の表示
  PartyName       = "%s"

  # 戦闘基本メッセージ
  Emerge          = "%sうんこ！"
  Preemptive      = "%sうんこぷりっと！"
  Surprise        = "%sうんこううんこ！"
  EscapeStart     = "%sうんこうんこ！"
  EscapeFailure   = "うんここ！"

  # 戦闘終了メッセージ
  Victory         = "%s ぷりっちょーん！"
  Defeat          = "%sうんこぉ・・・"
  ObtainExp       = "%s うんこくっそうんこ！"
  ObtainGold      = "糞 %s\\unko うんこ！"
  ObtainItem      = "%sうんぴっぴ！"
  LevelUp         = "%s %s うんちぁ！ %s うんちぁ！"
  ObtainSkill     = "ぶりっと %s"

  # アイテム使用
  UseItem         = "%s %sうんこ！"

  # クリティカルヒット
  CriticalToEnemy = "うんこぉぉぉ！！"
  CriticalToActor = "うーんこぉぉ！！"

  # アクター対象の行動結果
  ActorDamage     = "%s %s ウンーコうんこ！"
  ActorRecovery   = "%s %sが %s うんここ！"
  ActorGain       = "%s %sが %s うんちぁ！"
  ActorLoss       = "%s %sが %s うんちぃ！"
  ActorDrain      = "%s %sを %s うこここ！"
  ActorNoDamage   = "%s ウンーコうんこここ！"
  ActorNoHit      = "ぷり！　%s ウンーコうんこここ！"

  # 敵キャラ対象の行動結果
  EnemyDamage     = "%s %s うんここ！"
  EnemyRecovery   = "%s %s  %s うんこぉ！"
  EnemyGain       = "%s %s  %s うんぴぁ！"
  EnemyLoss       = "%s %s  %s うんぴぃ！"
  EnemyDrain      = "%s %s  %s うんっこ！"
  EnemyNoDamage   = "%s ウンーコうここうんここ！"
  EnemyNoHit      = "プリ！　%s ウンーコうここんここ！"

  # 回避／反射
  Evasion         = "%sうんこうんっこ！"
  MagicEvasion    = "%sうんこうんーこ！"
  MagicReflection = "%sうんこぽっちゃん！"
  CounterAttack   = "%sうんここ！"
  Substitute      = "%s %sうんこっこ！"

  # 能力強化／弱体
  BuffAdd         = "%s %sうんちぁ！"
  DebuffAdd       = "%s %sうんちぃ！"
  BuffRemove      = "%s %sうんこうんっこ！"

  # スキル、アイテムの効果がなかった
  ActionFailure   = "%sうここうんこ！"

  # エラーメッセージ
  PlayerPosError  = "プレイヤーのうんこが設定されていません。"
  EventOverflow   = "コモンうんこの呼び出しが上限を超えました。"

  # 基本ステータス
  def self.basic(basic_id)
    "うんこ"
  end

  # 能力値
  def self.param(param_id)
    "うんこ"
  end

  # 装備タイプ
  def self.etype(etype_id)
    "うんこ"
  end

  # コマンド
  def self.command(command_id)
    "うんこ"
  end

  # 通貨単位
  def self.currency_unit
    "うんこ"
  end

  #--------------------------------------------------------------------------
  def self.level;       "ウンコ";     end   # レベル
  def self.level_a;     "ｳﾝｺ";        end   # レベル (短)
  def self.hp;          "Unko";       end   # HP
  def self.hp_a;        "unko";       end   # HP (短)
  def self.mp;          "Unko";       end   # MP
  def self.mp_a;        "unko";       end   # MP (短)
  def self.tp;          "Unko";       end   # TP
  def self.tp_a;        "unko";       end   # TP (短)
  #--------------------------------------------------------------------------
end
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

