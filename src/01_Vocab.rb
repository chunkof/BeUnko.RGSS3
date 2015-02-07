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
