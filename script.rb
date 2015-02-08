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
      elsif /[a-zA-Z]/ =~ ch then
        # 小文字
        if /[a-z]/ =~ ch then
          replace = ['u','n','k','o']
        # 大文字
        else
          replace = ['U','N','K','O']
        end
        serial = ('alpha'==last_type) ? max_stop(serial+1,replace.length-1) : 0;
        ch = replace[serial]
        last_type = 'alpha'
      # 継続
      elsif /[ー―～・]/ =~ ch then
        # last_type更新しない
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
# ■ DataManager
#------------------------------------------------------------------------------
# 　データベースとゲームオブジェクトを管理するモジュールです。ゲームで使用する
# ほぼ全てのグローバル変数はこのモジュールで初期化されます。
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # ● 通常のデータベースをロード
  #--------------------------------------------------------------------------
  def self.rename_to_unko(data)
    if data.nil? then
      return
    end
    if data.respond_to?(:name)         then data.name        = "うんこ" end
    if data.respond_to?(:nickname)     then data.nickname    = "うんこ" end
    data
  end
  class << self
    alias :beunko_datamanager_load_normal_database :load_normal_database unless method_defined?(:beunko_datamanager_load_normal_database)
  end
  def self.load_normal_database
    beunko_datamanager_load_normal_database()
    $data_actors.map!  {|data| rename_to_unko(data)}
    $data_classes.map! {|data| rename_to_unko(data)}

  end
  #--------------------------------------------------------------------------
  # ● 戦闘テスト用のデータベースをロード
  #--------------------------------------------------------------------------
  def self.load_battle_test_database
    $data_actors        = load_data("Data/BT_Actors.rvdata2")
    $data_classes       = load_data("Data/BT_Classes.rvdata2")
    $data_skills        = load_data("Data/BT_Skills.rvdata2")
    $data_items         = load_data("Data/BT_Items.rvdata2")
    $data_weapons       = load_data("Data/BT_Weapons.rvdata2")
    $data_armors        = load_data("Data/BT_Armors.rvdata2")
    $data_enemies       = load_data("Data/BT_Enemies.rvdata2")
    $data_states        = load_data("Data/BT_States.rvdata2")
  end
end

#==============================================================================
# ■ Game_Actor
#------------------------------------------------------------------------------
# 　アクターを扱うクラスです。このクラスは Game_Actors クラス（$game_actors）
# の内部で使用され、Game_Party クラス（$game_party）からも参照されます。
#==============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # ● セットアップ
  #--------------------------------------------------------------------------
  alias beunko_game_actor_setup setup
  def setup(actor_id)
    beunko_game_actor_setup(actor_id)
    @name = "うんこ"
    @nickname = "うんこ"
  end
end

#==============================================================================
# ■ Game_Enemy
#------------------------------------------------------------------------------
# 　敵キャラを扱うクラスです。このクラスは Game_Troop クラス（$game_troop）の
# 内部で使用されます。
#==============================================================================
class Game_Enemy < Game_Battler
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  alias beunko_game_enemy_initialize initialize
  def initialize(index, enemy_id)
    beunko_game_enemy_initialize(index, enemy_id)
    @original_name = "うんこ"
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

#==============================================================================
# ■ Window_MapName
#------------------------------------------------------------------------------
# 　マップ名を表示するウィンドウです。
#==============================================================================

class Window_MapName < Window_Base
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    unless $game_map.display_name.empty?
      draw_background(contents.rect)
      draw_text(contents.rect, BeUnko::string($game_map.display_name), 1)
    end
  end
end
