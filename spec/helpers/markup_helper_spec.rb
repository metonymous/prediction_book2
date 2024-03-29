require 'spec_helper'

describe MarkupHelper do
  include MarkupHelper
  
  describe '#confidence_and_count' do
    it 'should return the number of wagers of a prediction' do
      prediction = double(Prediction, :wager_count=> 20).as_null_object
      confidence_and_count(prediction).should =~ /20/
    end
    
    it 'should return the mean confidence of a prediction' do
      prediction = double(Prediction, :mean_confidence => '13').as_null_object
      confidence_and_count(prediction).should =~ /13/
    end
  end
  
  describe 'certainty_heading' do
    it 'should add % to the end of the heading' do
      certainty_heading('60').should == '60%'
    end
    
    describe '100% easter egg' do
      before(:each) do
        @egg = certainty_heading('100')
      end
      it 'should add wiki almost surely article link' do
        @egg.should have_link('Almost surely', :href=> 'http://en.wikipedia.org/wiki/Almost_surely')
      end
    end
  end
  
  describe 'css classes helper' do
    it 'should join args together with spaces' do
      classes('one', 'two').should == 'one two'
    end
    
    it 'should filter out nils' do
      classes('test', nil, 'val').should == 'test val'
    end
    
    it 'should flatten lists in the argument list' do
      classes('test', %w(two three)).should == 'test two three'
    end
  end
end
