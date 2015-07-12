require 'java'

require "../jars/first.jar"

import org.beeing_tested.First;


java_import 'java.io.PrintStream'
java_import 'java.io.ByteArrayOutputStream'
java_import 'java.lang.System'


describe "First" do
  before do
    @first = First.new
  end

  def capture_stdout
    sys_out_stream = System.out

    my_output_stream = ByteArrayOutputStream.new
    System.setOut(PrintStream.new(my_output_stream))

    yield
    my_output_stream.toString
  ensure
    System.setOut(sys_out_stream)
  end

  it "should return name" do
    @first.name.should == "i'm First"
  end

  it "should print hellow world" do
    capture_stdout do
      @first.say_hi
    end.should == "Hello, World!\n"
  end

  it "should raise exception" do
    expect {
      @first.boom
    }.to raise_error(Java::JavaLang::UnsupportedOperationException, "boom")
  end

  it "should return array" do
    java_array = @first.an_array
    java_array.should be_a(ArrayJavaProxy)

    java_array.to_ary.should == [0, 9, 8, 7, 6]
  end

  it "should return float" do
    @first.a_float.should == 1.2345
  end

  it "should return date" do
    date = @first.a_date
    date.should be_a(Java::JavaUtil::Date)
    date.time.should be_within(1000).of(Time.now.to_f * 1000)
  end
end