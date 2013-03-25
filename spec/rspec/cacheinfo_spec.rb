require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe "typo3.org X-Cacheinfo headers" do

  %w{/ /download /about /news}.each do |path|
    describe "landingpage headers" do
      headers = TestHttp.get(path).headers
      it "should deny logins" do
        headers.keys.should  include("x-t3cacheinfo")
        headers["x-t3cacheinfo"].should  =~ /noLoginAllowedInBranch/
      end

      it "should not contain INT warnings" do
        headers["x-t3cacheinfo"].should_not =~ /INT/
      end
    end
  end

  describe "login sensitve pages" do
    headers = TestHttp.get("/events/add-new-event/").headers
    it "should allow logins" do
      headers.keys.should  include("x-t3cacheinfo")
      headers["x-t3cacheinfo"].should  =~ /loginAllowedInBranch/
    end
  end
end

