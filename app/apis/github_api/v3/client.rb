require 'oj'
require 'faraday'

module GithubApi
  module V3
    class Client
      include HttpStatusCodes
      include ApiExceptions

      API_ENDPOINT = 'https://api.github.com'.freeze
      API_REQUESTS_QUOTA_REACHED_MESSAGE = 'API rate limit exceeded'.feeze

      attr_reader :oauth_token

      def initialize(oauth_token = nil)
        @oauth_token = oauth_token
      end

      def user_repos(username)
        request(
          http_method: :get,
          endpoint: "users/#{username}/repos"
        )
      end

      def user_orgs(username)
        request(
          http_method: :get,
          endpoint: "users/#{username}/orgs"
        )
      end

      private 
      
      def client
        @_client ||= Faraday.new(API_ENDPOINT) do |client|
          client.request :url_encoded
          client.adapter Faraday.default_adapter
          client.headers['Authorization'] = "token #{oauth_token}" if oauth_token.present?
        end
      end

      def request(http_method:, endpoint:, params: {})
        response = client.public_send(http_method, endpoint, params)
        parsed_response = Oj.load(response.body)

        return parsed_response if response_successful?

        raise error_class, "Code: #{response.status}, response: #{response.body}"
      end

      def error_class
        case response.status
        when HTTP_BAD_REQUEST_CODE
          BadRequestError
        when HTTP_UNAUTHORIZED_CODE
          UnauthorizedError
        when HTTP_FORBIDDEN_CODE
          return ApiRequestsQuotaReachedError if api_request_quota_reached?
          ForbiddenError
        when HTTP_NOT_FOUND_CODE
          NotFoundError
        when HTTP_UNPROCESSABLE_ENTITY_CODE
          UnprocessableEntityError
        else
          ApiError
        end
      end

      def response_successful?
        response.status == HTTP_OK_CODE
      end

      def api_request_quota_reached?
        response.body.match?(API_REQUEST_QUOTA_REACHED_MESSAGE)
      end
    end
  end
end
