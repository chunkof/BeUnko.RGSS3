#==============================================================================
# �� Window_Base
#------------------------------------------------------------------------------
# �@�Q�[�����̑S�ẴE�B���h�E�̃X�[�p�[�N���X�ł��B
#==============================================================================

class Window_Base < Window
  #--------------------------------------------------------------------------
  # �� ���䕶���̎��O�ϊ�
  #    ���ۂ̕`����n�߂�O�ɁA�����Ƃ��ĕ�����ɕς����̂�����u��������B
  #    �����u\�v�̓G�X�P�[�v�����i\e�j�ɕϊ��B
  #--------------------------------------------------------------------------
  alias beunko_window_base_convert_escape_characters convert_escape_characters
  def convert_escape_characters(text)
    result = BeUnko::string(text.to_s)
    result = beunko_window_base_convert_escape_characters(result)
    result
  end
end

