import { FC } from "react"
import { Label } from "@/components/ui/label"

interface ProfileStepProps {
  username: string
}

export const ProfileStep: FC<ProfileStepProps> = ({ username }) => {
  return (
    <div className="space-y-1">
      <Label>Your Username</Label>
      <div className="rounded-md border bg-black p-2">
        <span className="font-medium">{username}</span>
      </div>
      <p className="text-sm text-gray-500">
        This is your automatically generated username. You can proceed to the
        next step.
      </p>
    </div>
  )
}
