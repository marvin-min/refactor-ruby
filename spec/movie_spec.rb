require './app/movie.rb'
RSpec.describe Movie do

  describe '#initialize' do
    it 'returns the given title and price_code' do
      movie = Movie.new("GOT",0)
      expect(movie.title).to eq "GOT"
      expect(movie.price_code).to eq 0
    end
  end

  describe '#charge' do
    context 'when REGULAR movie' do
      let(:movie) { Movie.new("REGULAR movie",Movie::REGULAR)}
      it 'returns charge is 2 if the days_rented is 1' do
        expect(movie.charge(1)).to eq 2
      end

      it 'returns charge is 2 if the days_rented is 2' do
        expect(movie.charge(1)).to eq 2
      end

      it 'returns charge is 2 if the days_rented is 3' do
        expect(movie.charge(3)).to eq 3.5
      end

    end

    context 'when NEW_RELEASE movie' do
      let(:movie) { Movie.new("NEW_RELEASE movie",Movie::NEW_RELEASE)}
      it 'returns charge is 3 when days_rented is 1' do
        expect(movie.charge(1)).to eq 3
      end


      it 'returns charge is 6 when days_rented is 2' do
        expect(movie.charge(2)).to eq 6
      end

      it 'returns charge is 6 when days_rented is 3' do
        expect(movie.charge(3)).to eq 9
      end
    end
  end
end
