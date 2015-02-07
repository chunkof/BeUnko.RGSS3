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
  def self.cancel;      "おしっこ";   end   # やめる
  #--------------------------------------------------------------------------
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
