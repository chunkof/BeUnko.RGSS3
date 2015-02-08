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
      # �Ђ炪��
      if    /\p{Hiragana}/ =~ ch then
        # ����������
        if /[�����������������]/ =~ ch then
          replace = ['��','��','��']
          serial = ('hira'==last_type) ? serial : 0;
        # �i�~��
        else
          replace = ['��','��','��']
          serial = ('hira'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'hira'
      # �J�^�J�i
      elsif /\p{Katakana}/ =~ ch then
        # ����������
        if /[�@�B�D�F�H�����b��������]/ =~ ch then
          replace = ['�D','�b','�H']
          serial = ('kata'==last_type) ? serial : 0;
        # ����������(���p)
        elsif /[���������������]/ =~ ch then
          replace = ['�','�','�']
          serial = ('kata'==last_type) ? serial : 0;
        # �i�~��(���p)
        elsif /[�-�]/ =~ ch then
          replace = ['�','�','�']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        # �i�~��
        else
          replace = ['�E','��','�R']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'kata'
      # ����
      elsif /[��-ꞁX]/ =~ ch then
        ch = '��'
        last_type = 'kanji'
      # �A���t�@�x�b�g
      elsif /[a-zA-Z]/ =~ ch then
        # ������
        if /[a-z]/ =~ ch then
          replace = ['u','n','k','o']
        # �啶��
        else
          replace = ['U','N','K','O']
        end
        serial = ('alpha'==last_type) ? max_stop(serial+1,replace.length-1) : 0;
        ch = replace[serial]
        last_type = 'alpha'
      # �p��
      elsif /[�[�\�`�E]/ =~ ch then
        # last_type�X�V���Ȃ�
      # ���̑�
      else
        last_type = '-'
      end
      
      result = result + ch.to_s
    }
    
    return result
  end
end


