require 'bowling'
require 'json'

RSpec.describe Bowling do
    let(:bowling) { bowling = Bowling.new }

    describe "#score" do
        context "with no strikes or spares" do
            before { 20.times { bowling.hit 4 } }
            it { expect(bowling.score).to eq 80 }
            it { expect(bowling.strikes).to eq 0 }
            it { expect(bowling.spares).to eq 0 }
            it { expect(bowling.done).to be false }
        end

        context "with a stike" do
            before do
                bowling.strike
                bowling.hit 5
            end

            it { expect(bowling.score).to eq 25 }
            it { expect(bowling.strikes).to eq 1 }
            it { expect(bowling.spares).to eq 0 }
            it { expect(bowling.done).to be false }
        end

        context "with a spare" do
            before { bowling.spare }
            it { expect(bowling.score).to eq 10 }
            it { expect(bowling.strikes).to eq 0 }
            it { expect(bowling.spares).to eq 1 }
            it { expect(bowling.done).to be false }
        end

        context "after some rolls" do
            before do
                4.times { bowling.hit 5 }
                3.times { bowling.strike }
                4.times { bowling.spare }
            end

            it { expect(bowling.score).to eq 120 }
            it { expect(bowling.strikes).to eq 3 }
            it { expect(bowling.spares).to eq 4 }
            it { expect(bowling.done).to be true }
        end
    end

    describe "#reset" do
        before { bowling.reset }
        it { expect(bowling.score).to eq 0 }
        it { expect(bowling.strikes).to eq 0 }
        it { expect(bowling.spares).to eq 0 }
        it { expect(bowling.done).to be false }
    end

    context "formating" do
        before do
            4.times { bowling.hit 5 }
            3.times { bowling.strike }
            4.times { bowling.spare }
        end

        describe "#to_hash" do
            it { expect(bowling.to_hash).to eq({"score" => 120, "strikes" => 3, "spares" => 4, "done" => true}) }
        end

        describe "#to_json" do
            let(:json_value) { "{\n  \"score\": 120,\n  \"strikes\": 3,\n  \"spares\": 4,\n  \"done\": true\n}" }
            before { allow(JSON).to receive(:pretty_generate).and_return json_value }
            it { expect(bowling.to_json).to eq json_value }
        end
    end
end
