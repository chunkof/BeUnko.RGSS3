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

